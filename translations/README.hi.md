# OpenEBS

[![Releases](https://img.shields.io/github/release/openebs/openebs/all.svg?style=flat-square)](https://github.com/openebs/openebs/releases)
[![Slack channel #openebs](https://img.shields.io/badge/slack-openebs-brightgreen.svg?logo=slack)](https://kubernetes.slack.com/messages/openebs)
[![Twitter](https://img.shields.io/twitter/follow/openebs.svg?style=social&label=Follow)](https://twitter.com/intent/follow?screen_name=openebs)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](https://github.com/openebs/openebs/blob/master/CONTRIBUTING.md)
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fopenebs%2Fopenebs.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2Fopenebs%2Fopenebs?ref=badge_shield)
[![CII Best Practices](https://bestpractices.coreinfrastructure.org/projects/1754/badge)](https://bestpractices.coreinfrastructure.org/projects/1754)

https://openebs.io/
 
**OpenEBS** के लिए खुले स्रोत भंडारण समाधान का उपयोग करने के लिए सबसे व्यापक रूप से तैनात और आसान है ए Kubernetes. 

**OpenEBS** भंडारण समाधानों की श्रेणी का अग्रणी खुला स्रोत उदाहरण है जिसे कभी-कभी कहा जाता है [Container Attached Storage](https://www.cncf.io/blog/2018/04/19/container-attached-storage-a-primer/). **OpenEBS** में एक ओपन-सोर्स उदाहरण के रूप में सूचीबद्ध है [CNCF Storage Landscape White Paper](https://github.com/cncf/sig-storage/blob/master/CNCF%20Storage%20Landscape%20-%20White%20Paper.pdf) में hyperconverged storage solutions नीचे.

अन्य पारंपरिक भंडारण समाधानों की तुलना में OpenEBS को अलग बनाने वाले कुछ प्रमुख पहलू:
- Built using the micro-services architecture like the applications it serves. OpenEBS is itself deployed as a set of containers on Kubernetes worker nodes. Uses Kubernetes itself to orchestrate and manage OpenEBS components
- पूरी तरह से किसी भी ओएस / प्लेटफॉर्म पर चलने के लिए इसे बहुत ही पोर्टेबल बनाने वाले यूजरस्पेस में बनाया गया है
- विशुद्ध रूप से उद्देश्य चलाता है, कुबेरनेट्स के साथ आसानी से ड्राइव करने वाले समान सिद्धांतों को विरासत में मिला है
- OpenEBS supports a range of storage engines so that developers can deploy the storage technology appropriate to their application design objectives. Distributed applications like Cassandra can use the LocalPV engine for lowest latency writes. Monolithic applications like MySQL and PostgreSQL can use the ZFS engine (cStor) for resilience. Streaming applications like Kafka can use the NVMe engine [Mayastor](https://github.com/openebs/Mayastor) for best performance in edge environments. Across engine types, OpenEBS provides a consistent framework for high availability, snapshots, clones and manageability.

OpenEBS अपने मेजबान पर दूसरे कंटेनर के रूप में खुद को तैनात करता है और भंडारण सेवाओं को सक्षम करता है, जिन्हें पॉड, एप्लिकेशन, क्लस्टर या कंटेनर स्तर पर निर्दिष्ट किया जा सकता है, जिसमें शामिल हैं:
- कुबेरनेट्स कार्यकर्ता नोड्स से जुड़े भंडारण के प्रबंधन को स्वचालित करें और ओपनएबीएस पीवी या स्थानीय पीवी प्रदान करने के लिए भंडारण के उपयोग की अनुमति दें।
- नोड्स में डेटा की संगति, उदाहरण के लिए, कैसंड्रा के छल्ले के पुनर्निर्माण में खर्च किए गए समय को नाटकीय रूप से कम कर देता है।
- उपलब्धता क्षेत्रों और क्लाउड प्रदाताओं में डेटा का सिंक्रनाइज़ेशन उपलब्धता में सुधार करता है और उदाहरण के लिए कनेक्टिविटी / अलगाव को कम करता है।
- एक सामान्य स्तर ताकि आप AKS, या अपनी नंगे धातु, या GKE, या AWS पर चल रहे हों - भंडारण सेवाओं के लिए आपका वायरिंग और डेवलपर का अनुभव जितना संभव हो उतना अच्छा है।
- S3 और अन्य लक्ष्यों से और पर टायर का प्रबंधन।

एक पूरी तरह से कुबेरनेट्स मूल समाधान होने का एक अतिरिक्त लाभ यह है कि प्रशासक और डेवलपर्स कुबेरनेट्स के लिए उपलब्ध सभी अद्भुत टूलिंग जैसे कुबेटल, हेल्म, प्रोमेथियस, ग्रेफाना, वीव स्कोप आदि का उपयोग करके ओपनईबीएस से संपर्क और प्रबंधन कर सकते हैं।

** हमारी दृष्टि ** सरल है: स्थैतिक वर्कलोड के लिए भंडारण और भंडारण सेवाओं को पूरी तरह से पर्यावरण में एकीकृत किया जाता है ताकि प्रत्येक टीम और कार्यभार नियंत्रण ग्रैन्युलैरिटी और कुबेरनेट्स मूल व्यवहार से लाभान्वित हों।

#### * इसे पढ़ें [अन्य भाषाओं](translations/TRANSLATIONS.md). में। *

[🇩🇪](translations/README.de.md)
[🇷🇺](translations/README.ru.md)
[🇹🇷](translations/README.tr.md)
[🇺🇦](translations/README.ua.md)
[🇨🇳](translations/README.zh.md)

## स्केलेबिलिटी

OpenEBS कंटेनरीकृत भंडारण नियंत्रकों की एक बड़ी संख्या को समायोजित करने के लिए स्केल कर सकता है। कुबेरनेट का उपयोग इन्वेंट्री जैसे बुनियादी टुकड़े प्रदान करने के लिए किया जाता है। आपके Kubernetes तराजू की सीमा तक OpenEBS तराजू।

## स्थापना और शुरू

OpenEBS को कुछ सरल चरणों में स्थापित किया जा सकता है।
आप Kubernetes नोड्स पर openebs- ऑपरेटर स्थापित करके और kubectl का उपयोग करके ओपन-इस्की-ऑपरेटर चलाकर कुबेरनेट क्लस्टर की अपनी पसंद पर जा सकते हैं।

**ऑपरेटर शुरू करके OpenEBS सेवाएँ**
```bash
# apply this yaml
kubectl apply -f https://openebs.github.io/charts/openebs-operator.yaml
```

**हेल्म का उपयोग करके OpenEBS सेवाएं शुरू करें**
```bash
helm repo update
helm install --namespace openebs --name openebs stable/openebs
```
आप हमारे [क्विकस्टार्ट गाइड] (https://docs.openebs.io/docs/overview.html) का भी अनुसरण कर सकते हैं।

OpenEBS को किसी भी Kubernetes क्लस्टर पर कॉन्फ़िगर किया जा सकता है - या तो पूर्ववर्ती पर या क्लाउड में डेवलपर लैपटॉप (Minicube) पर।
ध्यान दें कि आवश्यक आंतरिक कर्नेल में कोई परिवर्तन नहीं है क्योंकि OpenEBS उपयोगकर्ता अंतरिक्ष में काम करता है। कृपया हमारे [OpenEBS सेटअप] (https://docs.openebs.io/docs/overview.html) प्रलेखन का पालन करें। इसके अलावा, हमारे पास एक वैग्रांट वातावरण उपलब्ध है जिसमें नमूना कुबेरनेट तैनाती और कृत्रिम भार शामिल हैं जिन्हें आप ओपनएबीएस प्रदर्शन के लिए उपयोग कर सकते हैं। आपको लिटमस (https://litmuschaos.io) से संबंधित एक दिलचस्प प्रोजेक्ट भी मिल सकता है, जो कुबेरनेट्स पर राज्य के कार्यभार के लिए अराजक इंजीनियरिंग में मदद करता है।

## स्थिति

OpenEBS उद्योग में सबसे अधिक उपयोग और परीक्षण किए जाने वाले कुबेरनेट्स स्टोरेज इन्फ्रास्ट्रक्चर में से एक है। मई 2019 के बाद से एक सीएनसीएफ सैंडबॉक्स परियोजना, पार्टी और क्लाउड सिस्टम, और स्टेटफुल लोड पर दोनों के लिए कई बैकएंड (स्थानीय, एनएफ़एफ़, एनएफएम, एनवीएम) पर सॉफ्टवेयर परिभाषित भंडारण क्षमताओं के एक निरंतर सेट की पेशकश करने वाली पहली और एकमात्र भंडारण प्रणाली है। उनके कैओस इंजीनियरिंग फ्रेमवर्क के लिए स्रोत को खोलने वाला पहला था [लिटमस प्रोजेक्ट] (https://litmuschaos.io), जो ओपनईबीएस संस्करणों की मासिक प्रासंगिकता का मूल्यांकन करने के लिए समुदाय की खुली तैयारी पर निर्भर करता है। एंटरप्राइज़ ग्राहक 2018 से उत्पादन में OpenEBS का उपयोग कर रहे हैं और परियोजना एक सप्ताह में 2.5M + docker खींचने का समर्थन करती है।

नीचे विभिन्न स्टोरेज इंजनों की स्थिति दी गई है जो कि ओपन ईबीएस प्रतिशत वॉल्यूम को शक्ति देते हैं। शर्तों के बीच मुख्य अंतर संक्षेप में दिए गए हैं:
- **अल्फा:** नोटिस के बिना, एपीआई बाद के सॉफ़्टवेयर रिलीज़ में असंगत रूप से बदल सकता है, बस त्रुटियों के जोखिम और दीर्घकालिक समर्थन की कमी के कारण, अल्पकालिक परीक्षण समूहों में उपयोग के लिए अनुशंसित है।
- **बीटा**: समग्र सुविधाओं के लिए समर्थन छोड़ा नहीं जाएगा, हालांकि विवरण बदल सकते हैं। संस्करणों के बीच उन्नयन या स्थानांतरित करने के लिए समर्थन स्वचालन या मैनुअल चरणों के माध्यम से प्रदान किया जाएगा।
- **स्थिर**: प्रकाशित सॉफ़्टवेयर सुविधाएँ बाद के कई संस्करणों के लिए दिखाई देंगी और अधिकांश संस्करणों में सॉफ़्टवेयर स्वचालन प्रदान करेंगी।

| Storage Engine | Status | Details |
|---|---|---|
| Jiva | stable | Kubernetes नोड्स पर प्रतिकृति ब्लॉक भंडारण चलाने के लिए सबसे अच्छा है जो काम करने वाले नोड्स पर अल्पकालिक भंडारण का उपयोग करता है |
| cStor | बीटा | अवरुद्ध उपकरणों के साथ नोड पर चलने के लिए एक चयनित विकल्प। यदि स्नैपशॉट और क्लोन आवश्यक हैं तो अनुशंसित विकल्प |
| स्थानीय वॉल्यूम | बीटा | कम विलंबता भंडारण की आवश्यकता वाले वितरित अनुप्रयोगों के लिए सबसे उपयुक्त - भंडारण सीधे कुबेरनेट्स नोड्स से जुड़ा हुआ है। |
| मायास्तोर | अल्फा | एक नया भंडारण इंजन जो स्थानीय भंडारण क्षमता पर काम करता है, लेकिन प्रतिकृति जैसी भंडारण सेवाएं भी प्रदान करता है। विकास स्नैपशॉट और क्लोन का समर्थन करना जारी रखता है। |

अधिक जानकारी के लिए, [OpenEBS प्रलेखन] (https://docs.openebs.io/docs/next/quickstart.html) देखें।
 
## योगदान

OpenEBS किसी भी तरह से आपकी प्रतिक्रिया और योगदान का स्वागत करता है।

- 'कुबेरनेट्स स्लैक पर ओपनईबीएस समुदाय में शामिल हों] (https://kubernetes.slack.com)
  - पहले से ही साइन अप? यहां हमारी चर्चाओं पर जाएं: [#openebs] (https://kubernetes.slack.com/messages/openbs/)
- एक मुद्दा उठाना चाहते हैं या सुधार और सुविधाओं के साथ मदद करना चाहते हैं?
  - देखें [खुले मुद्दे] (https://github.com/openebs/openebs/issues)
  - देखें [योगदान मार्गदर्शिका] (./CONTRIBUTING.md)
  - हमारी योगदान देने वाली सामुदायिक बैठकों में शामिल होना चाहते हैं, [इसे देखें] (./ समुदाय / README.md)।
- हमारे OpenEBS सीएनसीएफ मेलिंग सूचियों में शामिल हों
  - OpenEBS प्रोजेक्ट अपडेट के लिए, [OpenEBS घोषणाएँ] (https://lists.cncf.io/g/cncf-openebs-announcements) की सदस्यता लें
  - अन्य OpenEBS उपयोगकर्ताओं के साथ संवाद करने के लिए, [OpenEBS उपयोगकर्ता] (https://lists.cncf.io/g/cncf-openebs-users) की सदस्यता लें
  
## मुझे कोड दिखाएं

यह OpenEBS के लिए एक मेटा-रिपॉजिटरी है। कृपया पिन किए गए रिपॉजिटरी या [OpenEBS आर्किटेक्चर] (./ योगदान / डिज़ाइन / README.md) दस्तावेज़ के साथ शुरू करें।

## लाइसेंस

OpenEBS ने परियोजना स्तर पर [Apache लाइसेंस 2.0] (https://github.com/openebs/openebs/blob/master/LICENSE) लाइसेंस विकसित किया है। परियोजना के कुछ घटकों को अन्य खुले स्रोत परियोजनाओं से लिया गया है और उनके संबंधित लाइसेंस के तहत वितरित किया गया है।

OpenEBS सीएनसीएफ प्रोजेक्ट्स का एक हिस्सा है।

[![CNCF Sandbox Project](https://raw.githubusercontent.com/cncf/artwork/master/other/cncf-sandbox/horizontal/color/cncf-sandbox-horizontal-color.png)](https://landscape.cncf.io/selected=open-ebs)

## Commercial Offerings

यह तृतीय-पक्ष कंपनियों और व्यक्तियों की एक सूची है जो OpenEBS से संबंधित उत्पाद या सेवाएं प्रदान करते हैं। OpenEBS एक सीएनसीएफ परियोजना है जो किसी भी कंपनी का समर्थन नहीं करती है। सूची वर्णमाला क्रम में दी गई है।
- [Clouds Sky GmbH](https://cloudssky.com/en/)
- [CodeWave](https://codewave.eu/)
- [Gridworkz Cloud Services](https://gridworkz.com/)
- [MayaData](https://mayadata.io/)
