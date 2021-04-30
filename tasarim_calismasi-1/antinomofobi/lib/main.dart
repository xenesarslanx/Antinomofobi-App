import 'package:antinomofobi/ilkSayfa.dart';
import 'package:flutter/material.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';
void main() async{
  runApp(MyApp());
  await AndroidAlarmManager.initialize();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
           
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:ilkSayfa()
    );
  }
}

/*import 'package:flutter/material.dart';
import 'dart:async';
import 'package:usage_stats/usage_stats.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<EventUsageInfo> events = [];
  Map<String, NetworkInfo> _netInfoMap = Map();

  @override
  void initState() {
    super.initState();
    initUsage();
  }

  Future<void> initUsage() async {
    UsageStats.grantUsagePermission();
    DateTime endDate = new DateTime.now();
    DateTime startDate = endDate.subtract(Duration(days: 30));

    List<EventUsageInfo> queryEvents = await UsageStats.queryEvents(startDate, endDate);
    //List<NetworkInfo> networkInfos = await UsageStats.queryNetworkUsageStats(startDate, endDate);
    //Map<String, NetworkInfo> netInfoMap = Map.fromIterable(networkInfos, key: (v) => v.packageName, value: (v) => v);

    this.setState(() {
      events = queryEvents.reversed.toList();
   //   _netInfoMap = netInfoMap;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Usage Stats"),
        ),
        body: Container(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  var event = events[index];
                  var networkInfo = _netInfoMap[event.packageName];
                  return ListTile(
                    title: Text(events[index].packageName),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "En Son Ne Zaman Kullanıldı: ${DateTime.fromMillisecondsSinceEpoch(int.parse(events[index].timeStamp)).toIso8601String()}"),
                        networkInfo == null
                            ? Text("")
                            : Text("Received bytes: ${networkInfo.rxTotalBytes}\n" +
                                "Transfered bytes : ${networkInfo.txTotalBytes}"),
                      ],
                    ),
                   // trailing: Text(events[index].eventType),
                  );
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: events.length)),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            initUsage();
          },
          child: Icon(
            Icons.refresh,
          ),
          mini: true,
        ),
      ),
    );
  }
}
class NetworkInfo {
  NetworkInfo({
    this.packageName,
    this.rxTotalBytes,
    this.txTotalBytes,
  });

  /// Construct class from the json map
  factory NetworkInfo.fromMap(Map map) => map == null
      ? null
      : NetworkInfo(
          packageName: map['packageName'],
          rxTotalBytes: map['rxTotalBytes'],
          txTotalBytes: map['txTotalBytes']
        );

  final String packageName;
  final String rxTotalBytes;
  final String txTotalBytes;
}

class ConfigurationInfo {
  ConfigurationInfo(
      {this.activationCount,
      this.totalTimeActive,
      this.configuration,
      this.lastTimeActive,
      this.firstTimeStamp,
      this.lastTimeStamp});

  /// Construct class from the json map
  factory ConfigurationInfo.fromMap(Map map) => map == null
      ? null
      : ConfigurationInfo(
          activationCount: map['activationCount'],
          totalTimeActive: map['totalTimeActive'],
          configuration: map['configuration'],
          lastTimeActive: map['lastTimeActive'],
          firstTimeStamp: map['firstTimeStamp'],
          lastTimeStamp: map['lastTimeStamp']);

  final String activationCount;
  final String totalTimeActive;
  final String configuration;
  final String lastTimeActive;
  final String firstTimeStamp;
  final String lastTimeStamp;
}

class EventInfo {
  EventInfo(
      {this.firstTimeStamp,
      this.lastTimeStamp,
      this.totalTime,
      this.lastEventTime,
      this.eventType,
      this.count});

  /// Construct class from the json map
  factory EventInfo.fromMap(Map map) => map == null
      ? null
      : EventInfo(
          firstTimeStamp: map['firstTimeStamp'],
          lastTimeStamp: map['lastTimeStamp'],
          totalTime: map['totalTime'],
          lastEventTime: map['lastEventTime'],
          eventType: map['eventType'],
          count: map['count']);

  final String firstTimeStamp;
  final String lastTimeStamp;
  final String totalTime;
  final String lastEventTime;
  final String eventType;
  final String count;
}
*/
