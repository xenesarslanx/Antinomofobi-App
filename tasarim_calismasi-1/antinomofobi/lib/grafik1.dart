import 'package:antinomofobi/grafik.dart';
import 'package:antinomofobi/ilkSayfa.dart';
import 'package:app_usage/app_usage.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class grafik1 extends StatefulWidget {
  @override
  grafik1State createState() => grafik1State();
}

class grafik1State extends State<grafik1> {
  List<GDPData> _chartData;
  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  var infoss = List.empty();
  List<AppUsageInfo> infos = [];
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SfCartesianChart(
        series: <ChartSeries>[
          BarSeries<GDPData, String>(
            dataSource: _chartData,
            xValueMapper: (GDPData gdp, _) => gdp.continent,
            yValueMapper: (GDPData gdp, _) => gdp.gdp,
          )
        ],
        primaryXAxis: CategoryAxis(),
      )),
    );
  }

  List<GDPData> getChartData() {
    ilkSayfaState ilksayfa = ilkSayfaState(); //dizi döndüren fonksiyondakı classdan obje 
    ilksayfa.getUsageStats();
   // var ilkeleman = ilk.dizi();
  
    final List<GDPData> chartData = [
      GDPData(deger.appIsmi,infos[0].usage.inMinutes.toInt())
      // GDPData('afrıca', 100),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}
