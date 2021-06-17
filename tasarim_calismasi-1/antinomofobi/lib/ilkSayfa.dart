/*import 'package:antinomofobi/grafikler/grafik.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_usage/app_usage.dart';

class ilkSayfa extends StatefulWidget {
  @override
  ilkSayfaState createState() => ilkSayfaState();
}


class ilkSayfaState extends State<ilkSayfa> {
 
  List<AppUsageInfo> infos = [];
 

  @override
  void initState() {
    super.initState();
  }

 
  
   getUsageStats() async {

    try {
      DateTime endDate = new DateTime.now();
      DateTime startDate = endDate.subtract(Duration(days: 1));
      List<AppUsageInfo> infoList =
          await AppUsage.getAppUsage(startDate, endDate);

      setState(() {
        infos = infoList;
       
      });

      for (var info in infoList) {
        print(info.toString());
        getUsageStats().then((value) => print(infos[1].usage.inMinutes.toInt()));
        
     
       
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
*/

