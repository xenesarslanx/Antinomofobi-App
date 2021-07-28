import 'package:antinomofobi/grafikler/grafik.dart';
import 'package:app_usage/app_usage.dart';
import 'package:flutter/material.dart';

class bilgi extends StatefulWidget {
  final List<AppUsageInfo> information;

  const bilgi({Key key, this.information});
  @override
  bilgiState createState() => bilgiState();
}

class bilgiState extends State<bilgi> {
  List<AppUsageInfo> infos = [];

  List<String> bilgiler = [
    'YATAK ODANIZA SOKMAYIN \n\n Yetişkinlerin üçte biri telefonlarını uyandıktan sonra geçen ilk 5 dakika içinde kontrol ediyor, yarısından fazlası ise ilk 15 dakika içinde. Yüzde 38’i ise geceleri telefonlarıyla ilgileniyor. Eğer hayatınızı kontrol altına almak istiyorsanız yatak odanıza telefonunuzu sokmayın.',
    'EVİN İÇİNDE YASAK ALANLARI BELİRLEYİN \n\n Evin içinde telefon kullanımın yasak olduğu alanlar belirlemek bitmeyen bir çatışmaya olan ihtiyacı ortadan kaldırabilir. Telefonları yatak odalarında yasaklamak herkese daha iyi bir uyku sağlarken yemek masasında yasaklamak da aileyi tekrar bir araya getirebilir. Yapılan çalışmalarda akıllı telefonun sadece varlığının bile yemek masasındaki sohbetler üzerinde olumsuz etkileri olabileceği gözlendi. Telefonunuzu masanın üzerinde tutmayın ve bir görüşme yapmanız gerektiğinde de öncesinde masadakilerden izin isteyin. Bu davranış etrafınızdaki insanların da kendi telefonlarıyla uğraşmasını engelleyecektir.',
    'BİLDİRİMLERİ KAPATIN \n\n Telefonunuzun titreşip yanıp sönmesine karşı koymak zor, ayarlardan bildirimleri kapatarak kontrolü elinize alabilirsiniz. Telefonunuzun cazibesini kullanmadığınız gereksiz uygulamaları silerek daha da azaltabilirsiniz. Telefonunuzda sadece yaşam kalitenizi yükselten, önemli uygulamaları tutun (haritalar, galeri, müzik vb.).',
    'SİNSİ UYGULAMALARI SİLİN \n\n Yaşam kalitenizi arttırmaktansa dikkatinizi dağıtan tüm uygulamaları silin. Eğer sizi mutsuz ediyorsa (mesela iş arkadaşınızın Facebook’taki tatil fotoğrafları) onu da silin. Sonuçta sosyal medyayı diz veya masaüstü bilgisayarınızdan da kontrol edebilirsiniz.',
    'SİZİ CEZBEDENLERİ BUDAYIN \n\n Fazla kullanmadığınız uygulamaları ve e-postanızı telefonun ikinci sayfasına taşıyın, kullanmadığınız ama silinemeyen uygulamaları da üçüncü sayfaya. Sizi cezbeden uygulamaları da bir dosyada toplayarak daha az dikkat çekmelerini sağlayabilirsiniz.',
    '"Telefonuma bakmayacağım" deyin \n\n Bakamam kelimesi, sanki dış güçler size yapmamanız gereken bir şey deklare etmiş de siz de mecburen ona uyuyormuşsunuz gibi hissettiriyor. Halbuki insan motivasyonu, dış güçlere bağlı çalışmaz. Hiçkimsenin bize bir şey yapıp yapmayacağımızı söylemesinden hoşlanmayız. Bu yüzden kendi kararınızı kendinizin verdiğini vurgulayın ve bakmamaya karar verdim deyin.\n\n fitness hedeflerine ulaşmaya çalışan kadınlarla ilgili bir çalışmadan bahsediliyor: Kendi kendilerine, "Fitness seansımı kaçıramam" diyenlerin sadece yüzde 10u fitness seansına gidiyor! Bunun yerine "Fitness seansımı kaçırmam" diyenlerin yüzde 80i hakikaten kaçırmıyor.',
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    // for(i = 0; i < bilgiler.length; i++){
//print('${bilgiler[i]}');
    //   }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Grafik(
                        information: infos,
                      )),
            ),
          ),
          title: Text('Tavsiyelerimiz'),
          backgroundColor: Colors.pink.shade100,
        ),
        body: ColoredBox(
          color: Colors.pink.shade50,
          child: Column(
            children: <Widget>[
              SizedBox(height: 100),
              Container(
                margin:
                    EdgeInsets.only(left: 10, top: 100, right: 10, bottom: 60),
                alignment: Alignment.bottomCenter,
                color: Colors.pink.shade200,
                width: double.infinity,
                height: 200,
                child: ClipRRect(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        left: 10, top: 20, right: 10, bottom: 140),
                    child: Text(
                      '${bilgiler[index]}',
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange.shade300,
                        onPrimary: Colors.white,
                      ),
                      child: Text('Önceki'),
                      onPressed: () {
                        setState(() {
                          index--;
                          if (index == -1) {
                            index++;
                          }
                        });
                      }),
                  SizedBox(width: 100),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange.shade600,
                        onPrimary: Colors.white,
                      ),
                      child: Text('Sonraki'),
                      onPressed: () {
                        setState(() {
                          index++;
                          if (index == bilgiler.length) {
                            index--;
                          }
                        });
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
