import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

/*class PieData {
  var infoss = List.empty();

  List<AppUsageInfo> infos = [];

  denemee() async {
  
    DateTime endDate = new DateTime.now();
    DateTime startDate = endDate.subtract(Duration(days: 1));
    List<AppUsageInfo> infoList =
        await AppUsage.getAppUsage(startDate, endDate);

    infos = infoList;
    infoss = infos; //infoss ben olusturdum


    a.dakka = infoss[0].usage.inMinutes.toInt();
    a.dakka2 = infoss[1].usage.inMinutes.toInt();
  }

 PieData pie = PieData();
  static List<Data> data = [
   
    Data(name: 'blue', percent:10, color: const Color(0xff0293ee)),
    Data(name: 'Orange', percent: 10, color: const Color(0xfff8b250)),
    Data(name: 'Black', percent: 10, color: Colors.black),
    Data(name: 'Green', percent: 15, color: const Color(0xff13d38e)),
  ];
}

class Data {

  String name;

   double percent;

   Color color;

  Data({this.name, this.percent, this.color});
}*/

//sütun grafik
class PopulationData {
 

  String appName;
  int usageMinute;

  PopulationData({
    @required this.appName,
    @required this.usageMinute,
    
  });
}

final List<PopulationData> data = [
 
  PopulationData(
    appName: 'a',
    usageMinute: 20,
  ),
  PopulationData(
    appName: 'b',
    usageMinute: 10
  ),
  PopulationData(
    appName: 'c',
    usageMinute: 10,
  ),
];

getSeriesData() {
  List<charts.Series<PopulationData, String>> series = [
    charts.Series(
      id: "Population",
     data: data,
      domainFn: (PopulationData series, _) => series.appName,
      measureFn: (PopulationData series, _) => series.usageMinute,
    )
  ];
  return series;
}

 


