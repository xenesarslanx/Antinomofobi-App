/*import 'package:antinomofobi/grafikler/grafik_data.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:app_usage/app_usage.dart';
import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
//import 'package:syncfusion_flutter_charts/charts.dart';
//import 'package:syncfusion_flutter_charts/sparkcharts.dart';
class Grafik extends StatefulWidget {
  final List<AppUsageInfo> information;
    Grafik({this.information});
  @override
  GrafikState createState() => GrafikState();
}

class GrafikState extends State<Grafik> {
 
//List<AppUsageInfo> infos = [];
int touchedIndex;
   
  List<AppUsageInfo> infos = [];

  var largest = [0];
  var largests = ['0'];

  var infoss = List.empty();

  getUsageStats() async {
    try {
      DateTime endDate = new DateTime.now();
      DateTime startDate = endDate.subtract(Duration(days: 1));
      List<AppUsageInfo> infoList =
          await AppUsage.getAppUsage(startDate, endDate);

      setState(() {
        infos = infoList;
        infoss = infos; //infoss ben olusturdum
      });

      for (int i = 0; i < infoList.length; i++) {
        if (infos[i].usage.inMinutes.toDouble() > 60.toDouble()) {
          print(
              '(bildirim) son 24 saatte 60 dakikadan fazla kullandınız ${infos[i].packageName}');
        }
      }

      int n = 0;
      for (n = 0; n < infoList.length; n++) {
        if (infoList[n].usage.inMinutes.toInt() > largest[0].toInt()) {
          largest[0] = infoList[n].usage.inMinutes.toInt();
          largests[0] = infoList[n].packageName.toString();
          deger.app = largests[0];
          deger.sure = largest[0].toDouble();
        }
      }
      print(
          'son 24 saatte en çok vakit harcanan uygulama: ${largests[0]} kullanım süresi: ${largest[0]} dk');
      print('${deger.sure}');
      print('${deger.app}');
   
// dizi sıralama

/*var max1 = infoss[0];
var max2 = infoss[1];
if(infos[1].usage.inMinutes.toInt()>infos[0].usage.inMinutes.toInt()){
  max1[0] = infos[1].usage.inMinutes.toInt();
  max2[0] = infos[0].usage.inMinutes.toInt();
}

for(int k = 2; k < infos.length; ++k)
if(infos[k].usage.inMinutes.toInt() > max1){
  max2[0] = max1[0];
  max1[0] = infos[k].usage.inMinutes.toInt();
}
else if (infos[k].usage.inMinutes.toInt() > max2[0])
max2[0] = infos[k].usage.inMinutes.toInt();

print('son 24 saatte en çok vakit harcanan 2. uygulama:${max2[0]}');*/
      /*  for (var info in infoList) {
        print(info.toString());
         }*/
    } on AppUsageException catch (exception) {
      print(exception);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('grafik'),
        ),
        
        body: Column(children: <Widget>[
          

          Expanded(
                      child:charts.BarChart(
                      getSeriesData(widget.information), 
                      animate: true,
                      domainAxis: charts.OrdinalAxisSpec(
                        renderSpec: charts.SmallTickRendererSpec(labelRotation: 60)
                      ),
                    ),
                      /* PieChart(
              PieChartData(
                pieTouchData: PieTouchData(
                    touchCallback: (pieTouchResponse) {
                   /* //  setState(() {
                        if (pieTouchResponse.touchInput is FlLongPressEnd ||
                            pieTouchResponse.touchInput is FlPanEnd) {
                          touchedIndex = -1;
                        } else {
                          touchedIndex = pieTouchResponse.touchedSectionIndex;
                        }
                      }
                      );*/
                    },
                  ),
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: getSections(touchedIndex),
              )
            ),
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: IndicatorsWidget(),
              ),
            ],
          ),*///
         /*   ElevatedButton(
            child: Text('Geri Dön'),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ilkSayfa()),
            ),
          ),
          ElevatedButton(onPressed: getUsageStats, child: null),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => grafik1()),
            ),
            child: Text('grafik1 e git'),
          ),*/
         ) ]),
      ),
    );
  }
}

class Degerler {
  String appIsmi;
  String app;
  double sure;
  Color colorval;
  List infos;
  double d=10;
  Degerler({this.app, this.sure, this.colorval, this.d});
}

Degerler deger = Degerler();
//
/*List<PieChartSectionData> data = [
  PieChartSectionData(
      title: '${deger.app}', color: Colors.red, value: deger.sure),
  PieChartSectionData(title: 'b', color: Colors.green, value: 20.0),
];
*/
*/