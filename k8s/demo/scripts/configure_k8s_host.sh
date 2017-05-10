#!/bin/bash -x

# Note:This script assumes the user has the permission to ssh into the master machine.
# Variables:
machineip=
masterip=
clusterip=
token=
hostname=`hostname`

function get_machine_ip(){
    ifconfig \
    | grep -oP "inet addr:\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}" \
    | grep -oP "\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}" | sort \
    | tail -n 1 | head -n 1
}

function update_hosts(){
    sudo sed -i "/$hostname/ s/.*/$machineip\t$hostname/g" /etc/hosts
}

function setup_k8s_minion(){
    sudo kubeadm join --token=$token ${masterip}:6443
}

function join_cni_network(){
    sudo route add $clusterip gw $masterip
}

#To make the minion backward compatible, disable
# the functionality of controller attach/detach
function disable_controller_attach_detach() {
    sudo sed -i "/KUBELET_AUTHZ_ARGS=/aEnvironment=\"KUBELET_VOL_ARGS=--enable-controller-attach-detach=false\"" \
     /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
    sudo sed -i "s/\$KUBELET_AUTHZ_ARGS/\$KUBELET_AUTHZ_ARGS \$KUBELET_VOL_ARGS/g" \
     /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
    sudo systemctl daemon-reload
    sudo systemctl restart kubelet
}

function show_help() {
    cat << EOF
    Usage : $(basename "$0") --masterip=<KubeMaster IP> --token=<Token> --clusterip=<Cluster IP>
    Create a Kubernetes Minion Node and Join the cluster.
    
    -h|--help                    Display this help and exit.
    -i|--masterip Kubemaster IP  IP of kubemaster to join the cluster.
    -t|--token Token             Token generated by kubeadm init.
    -c|--clusterip Cluster IP    ClusterIP of kubernetes to join CNI network.
EOF
}

# Code:
# Check whether we recieved the User and Master hostnames else Show usage
# Uses the long form of arguments now

if (($# == 0)); then
    show_help
    exit 2
fi

while :; do
    case $1 in
        -h|-\?|--help)  # Call a "show_help" function to 
                        # display a synopsis, then exit.
                        show_help
                        exit
                        ;;
        
        -i|--masterip)  # Takes an option argument, 
                        # ensuring it has been specified.
                        if [ -n "$2" ]; then
                            masterip=$2
                            shift
                        else
                            printf 'ERROR: "--masterip" requires \
                            a non-empty option argument.\n' >&2
                            exit 1
                        fi
                        ;;
        
        --masterip=?*)  # Delete everything up to "=" 
                        # and assign the remainder.
                        masterip=${1#*=} 
                        ;;
        
        --masterip=)    # Handle the case of an empty --masterip=
                        printf 'ERROR: "--masterip" requires \
                        a non-empty option argument.\n' >&2
                        exit 1
                        ;;

        -t|--token)     # Takes an option argument, 
                        # ensuring it has been specified.
                        if [ -n "$2" ]; then
                            token=$2
                            shift
                        else
                            printf 'ERROR: "--token" requires \
                            a non-empty option argument.\n' >&2
                            exit 1
                        fi
                        ;;
        
        --token=?*)     # Delete everything up to "=" 
                        # and assign the remainder.
                        token=${1#*=} 
                        ;;
        
        --token=)       # Handle the case of an empty --token=
                        printf 'ERROR: "--token" requires \
                        a non-empty option argument.\n' >&2
                        exit 1
                        ;;

        -c|--clusterip) # Takes an option argument, 
                        # ensuring it has been specified.
                        if [ -n "$2" ]; then
                            clusterip=$2
                            shift
                        else
                            printf 'ERROR: "--clusterip" requires \
                            a non-empty option argument.\n' >&2
                            exit 1
                        fi
                        ;;
        
        --clusterip=?*) # Delete everything up to "=" 
                        # and assign the remainder.
                        clusterip=${1#*=} 
                        ;;
        
        --clusterip=)   # Handle the case of an empty --clusterip=
                        printf 'ERROR: "--clusterip" requires \
                        a non-empty option argument.\n' >&2
                        exit 1
                        ;;
        
        --)             # End of all options.
                        shift
                        break
                        ;;
        
        -?*)
                        printf 'WARN: Unknown option (ignored): %s\n' "$1" >&2
                        ;;

        *)              # Default case: If no more options 
                        # then break out of the loop.
                        break
    esac
shift
done

if [ -z "$masterip" ]; then
    echo "MasterIP is mandatory."
    show_help
    exit    
fi

if [ -z "$token" ]; then
    echo "Token is mandatory."
    show_help
    exit    
fi

if [ -z "$clusterip" ]; then
    echo "ClusterIP is mandatory."
    show_help
    exit    
fi

#Get the machine ip, master ip, cluster ip and the token from the master
machineip=`get_machine_ip`

#Update the host files of the master and minion.
echo Updating the host files...
update_hosts

#Join the cluster
echo Setting up the Minion using IPAddress: $machineip
echo Setting up the Minion using Token: $token 
setup_k8s_minion

echo Patch the kubelet startup script to disable attach/detach controller
disable_controller_attach_detach


#Add route to the minion ip to the cluster ip
echo Joining the CNI Network...
join_cni_network
