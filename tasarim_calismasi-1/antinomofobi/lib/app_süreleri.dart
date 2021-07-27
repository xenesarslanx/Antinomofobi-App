import 'package:antinomofobi/grafikler/grafik.dart';
import 'package:antinomofobi/grafikler/pasta_grafik.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_usage/app_usage.dart';

import 'grafikler/grafik.dart';

class ilkSayfa extends StatefulWidget {
  @override
  ilkSayfaState createState() => ilkSayfaState();
}

class ilkSayfaState extends State<ilkSayfa> {
  GrafikState gstate = GrafikState(); // diğer class obje
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
      infos = infoList;

      return infos;
    } on AppUsageException catch (exception) {
      print(exception);
    }
  }

  @override
  Widget build(BuildContext context) {
    // print("merhaba"+infos.toString());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 1,
        child: Scaffold(
          // drawer:NavigationDrawerWidget(),
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.directions),
                ),
              ],
            ),
            title: Text('ANTİNOMOFOBİ'),
            actions: [
              IconButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => pieChart(
                            information: infos,
                          )),
                ),
                icon: new Icon(Icons.graphic_eq_rounded),
              ),
            ],
            backgroundColor: Colors.green,
          ),
          body: RefreshIndicator(
            onRefresh: refresh,
            child: FutureBuilder(
              future:
                  //gstate.getUsageStats(),
                  getUsageStats(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        print("deneme");
                        print("information " + snapshot.data[index].appName);
                        print(snapshot.data);

                        return ListTile(
                            //  leading:  Text(infos[index].usage.inMinutes.toString()),
                            title: Text(
                                'Uygulama Adı: ${snapshot.data[index].appName}'),
                            //  subtitle: Text('Uygulama Adı: ${infos[index].appName}'),
                            //subtitle: Text(infos[index].endDate.toString()),

                            subtitle: Text(
                                'Dakika kullanımı:${snapshot.data[index].usage.inMinutes}'), // her uyg. ne kadar kullandığım dk cinsi
                            // subtitle:Text(infos[index].startDate.toString()),

                            trailing: Text(
                              'Kullanım Süresi h/m/s: ${snapshot.data[index].usage.toString()}',
                            ));
                      });
                } else {
                  return CircularProgressIndicator(
                    color: Colors.red,
                  );
                }
              },
            ),
          ),
          // floatingActionButton: FloatingActionButton(
          //     onPressed: getUsageStats, child: Icon(Icons.refresh)),
        ),
      ),
    );
  }

  Future<void> refresh() async {
    DateTime endDate = new DateTime.now();
    DateTime startDate = endDate.subtract(Duration(days: 1));
    List<AppUsageInfo> infoList =
        await AppUsage.getAppUsage(startDate, endDate);
    infos = infoList;
    setState(() {});
  }
}
