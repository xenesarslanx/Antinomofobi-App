import 'package:app_usage/app_usage.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;


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
  //
  // PopulationData(
  //   appName: 'a',
  //   usageMinute: 200,
  // ),
 
];

Map<String, int> dataMap = {
    "Flutter": 5,
    "React": 3,
    
  };

getSeriesData(List<AppUsageInfo> information) {
//sort((a,b)=>a.usage.inMinutes.compareTo(b.usage.inMinutes))
  populationDataAdding(information);
//information.forEach((element)=>print(element.packageName));
 
  List<charts.Series<PopulationData, String>> series = [

    charts.Series(
      id: "Time Using",
     data: data,

      domainFn: (PopulationData series, _) {
      //  print(series.appName);
        return series.appName;},
      measureFn: (PopulationData series, _) => series.usageMinute,

    )
  ];
  return series;
}

 populationDataAdding(List<AppUsageInfo> information) {
   // PopulationData(
   //   appName: 'a',
   //   usageMinute: 200,
   // ),
//
   for (int i=0;i<information.length;i++){
     if(information[i].usage.inMinutes > 10){ //dakikası 10 den fazla olanları grafiğe aktar
    data.add(PopulationData(appName: information[i].packageName.substring(4) + ': ${information[i].usage.inMinutes} dk!',
     usageMinute: information[i].usage.inMinutes ));
    
     }
     
   };

}
///////////////////////////paket adlı grafik////////////////////////////////////////////////////////////////

class PopulationDataAyrinti {
 
  String appName2;
  int usageMinute2;

  PopulationDataAyrinti({
    @required this.appName2,
    @required this.usageMinute2,
    
  });
}

final List<PopulationDataAyrinti> dataAyrinti = [];

getSeriesDataAyrinti(List<AppUsageInfo> information1) {

  populationDataAddingAyrinti(information1);

 // print("get series dataya girdi");
  List<charts.Series<PopulationDataAyrinti, String>> series2 = [

    charts.Series(
      id: "Population",
     data: dataAyrinti,

      domainFn: (PopulationDataAyrinti series2, _) {
      //  print(series.appName);
        return series2.appName2;},
      measureFn: (PopulationDataAyrinti series2, _) => series2.usageMinute2,

    )
  ];
  return series2;
}

 populationDataAddingAyrinti(List<AppUsageInfo> information1) {
   
   for (int i=0;i<information1.length;i++){
     dataAyrinti.add(PopulationDataAyrinti(appName2: information1[i].packageName , usageMinute2: information1[i].usage.inMinutes));
     
   }
}


/*import 'package:flutter/material.dart';
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
*/
 


