import 'package:antinomofobi/grafikler/grafik_data.dart';
import 'package:antinomofobi/grafikler/pasta_grafik.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:app_usage/app_usage.dart';
import 'package:flutter/material.dart';

class Grafik extends StatefulWidget {
  final List<AppUsageInfo> information;
  final List<AppUsageInfo> information1;

  Grafik({this.information, this.information1});
  //Grafik graf = Grafik();
  @override
  GrafikState createState() => GrafikState();
}

class GrafikState extends State<Grafik> {
 
  List<AppUsageInfo> infos = [];
  List<AppUsageInfo> infoList;
  //int touchedIndex;

  var largest = [0];
  var largests = ['0'];
  var large = [];

  var infoss = List.empty();
  

  getUsageStats() async {
    try {
      DateTime endDate = new DateTime.now();
      DateTime startDate = endDate.subtract(Duration(days: 1));
      infoList = await AppUsage.getAppUsage(startDate, endDate);

      setState(() {
        infos = infoList;
        infoss = infos; //infoss ben olusturdum
      });
//son 24 saatte 60 dakikadan fazla kullanılan app bulma
      int t;
      for (t = 0; t < infoList.length; t++) {
        if (infos[t].usage.inMinutes > 60) {
          print('${infoList[t].packageName.substring(4)}');
          large.add('${infoList[t].packageName.substring(4)}');
          
        }
      }
   print(bildirim.de = 'son 24 saatte 60 dakikadan fazla kullandınız');
  // print('son 24 saatte 60 dakikadan fazla kullandınız ${bildirim.uyari=large}');
  bildirim.uyari = large;

//son 24 saatte en çok vakit harcanan app bulma
      int n = 0;
      for (n = 0; n < infoList.length; n++) {
        if (infoList[n].usage.inMinutes.toInt() > largest[0].toInt()) {
          largest[0] = infoList[n].usage.inMinutes.toInt();
          largests[0] = infoList[n].packageName.toString();
        }
      }
      
      print(bildirim.enCok =
          'son 24 saatte en çok vakit harcanan uygulama: ${largests[0].substring(4)}-> kullanım süresi: ${largest[0]} dk');
    } on AppUsageException catch (exception) {
      print(exception);
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text('Grafik'),
              actions: [
                  IconButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => pieChart(information: infos,)),
                ),
                icon: new Icon(Icons.graphic_eq_rounded),
              ),
              ],
            ),
            body: Column(children: [
              Wrap(
                children: [
                  ElevatedButton(
                      child: Text('Bildirim!'),
                      onPressed: () {
                        setState(() {
                          getUsageStats();
                        }
                        );
                      }
                      //getSeriesDataAyrinti(widget.information);}
                      ),
                  Container(
                    child: Text('${bildirim.enCok}'),
                  )
                ],
              ),

              Expanded(
                child: charts.BarChart(
                  getSeriesData(widget.information),
                  //barGroupingType: charts.BarGroupingType.grouped,

                  animate: true,
                  vertical: false, //grafik dikey veya yatay
                  domainAxis: charts.OrdinalAxisSpec(
                      renderSpec:
                          charts.SmallTickRendererSpec(labelRotation: 0)),
                ),
              ),

              //     ayrintiGrafik(),
            ]
            ),
            ),
            );
  }

  Expanded ayrintiGrafik() {
    return Expanded(
      child: charts.BarChart(
        getSeriesDataAyrinti(widget.information1),

        animate: true,
        vertical: false, //grafik dikey veya yatay
        domainAxis: charts.OrdinalAxisSpec(
            renderSpec: charts.SmallTickRendererSpec(labelRotation: 0)),
      ),
    );
  }
}

class Bildirim {
  List<dynamic> uyari;
   String enCok;
   String de;
  Bildirim({this.enCok, this.uyari, this.de});
}

Bildirim bildirim = Bildirim();
