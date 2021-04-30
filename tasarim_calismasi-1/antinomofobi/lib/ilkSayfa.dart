import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_usage/app_usage.dart';
import 'grafik.dart';

class ilkSayfa extends StatefulWidget {
  @override
  ilkSayfaState createState() => ilkSayfaState();
}

// double dk =infos[1].usage.inMinutes.toDouble();
class ilkSayfaState extends State<ilkSayfa> {
 
  List<AppUsageInfo> infos = [];
  List s = [];

  //ilkSayfaState({this.infos});

  var infoss = List.empty();
  @override
  void initState() {
    super.initState();
  }

  //Future<List<AppUsage>>
  Future<List<AppUsage>> dizi() async {
    DateTime endDate = new DateTime.now();
    DateTime startDate = endDate.subtract(Duration(days: 1));
   // List<AppUsageInfo> infoList
   List infoList  =
        await AppUsage.getAppUsage(startDate, endDate);
    
    s[0] = infoList[0].usage.inMinutes.toInt();
    
   
    //await prefs.setInt("Sayim", s);
    return s[0];
  }
  
   getUsageStats() async {

    try {
      DateTime endDate = new DateTime.now();
      DateTime startDate = endDate.subtract(Duration(days: 1));
      List<AppUsageInfo> infoList =
          await AppUsage.getAppUsage(startDate, endDate);

      setState(() {
        infos = infoList;
        infoss = infos;
      });

      for (var info in infoList) {
        print(info.toString());
        getUsageStats().then((value) => print(infos[1].usage.inMinutes.toInt()));
        
       //  print(a.dakka);
       
      }
      
    } on AppUsageException catch (exception) {
      print(exception);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 1,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.directions),
                ),
              ],
            ),
            title: const Text('ANTİNOMOFOBİ'),
            actions: [
              IconButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Grafik()),
                ),
                icon: new Icon(Icons.graphic_eq_rounded),
              ),
            ],
            backgroundColor: Colors.green,
          ),
          body: ListView.builder(
              itemCount: infos.length,
              itemBuilder: (context, index) {
                return ListTile(
                    //  leading:  Text(infos[index].usage.inMinutes.toString()),
                    title: Text('Uygulama Adı: ${infos[index].appName}'),
                    //  subtitle: Text('Uygulama Adı: ${infos[index].appName}'),
                    //subtitle: Text(infos[index].endDate.toString()),
                    subtitle: Text(
                        'Dakika kullanımı:${infos[index].usage.inMinutes.toString()}'), // her uyg. ne kadar kullandığım dk cinsi
                    // subtitle:Text(infos[index].startDate.toString()),

                    trailing: Text(
                      'Kullanım Süresi h/m/s: ${infos[index].usage.toString()}',
                    ));
              }),
          floatingActionButton: FloatingActionButton(
              onPressed: getUsageStats, child: Icon(Icons.refresh)),
        ),
      ),
    );
  }
}


