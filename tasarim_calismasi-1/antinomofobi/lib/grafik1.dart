/*import 'package:antinomofobi/grafik.dart';
import 'package:antinomofobi/ilkSayfa.dart';


import 'package:flutter/material.dart';
//import 'package:syncfusion_flutter_charts/charts.dart';

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



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SfCartesianChart(
        series: <ChartSeries>[
          BarSeries<GDPData, String>(
            dataSource: _chartData,
            yValueMapper: (GDPData gdp, _) => gdp.gdp,
            xValueMapper: (GDPData gdp, _) => gdp.continent,
          )
        ],
        primaryXAxis: CategoryAxis(  
         
        ),
       

      )
      ),
    );
  }

  List<GDPData> getChartData() {
    ilkSayfaState ilksayfa = ilkSayfaState(); //dizi döndüren fonksiyondakı classdan obje 
    ilksayfa.getUsageStats();
   // var ilkeleman = ilk.dizi();
  
   
    
  }
}*/

/*class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}
*/