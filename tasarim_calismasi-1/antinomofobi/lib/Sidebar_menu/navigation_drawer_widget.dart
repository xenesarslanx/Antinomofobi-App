/*import 'package:antinomofobi/grafikler/grafik.dart';
import 'package:antinomofobi/grafikler/pasta_grafik.dart';
import 'package:app_usage/app_usage.dart';
import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatefulWidget {
  // List<AppUsageInfo> information;
  // NavigationDrawerWidget({this.information});

  @override
  NavigationDrawerWidgetState createState() => NavigationDrawerWidgetState();
}

class NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  List<AppUsageInfo> infos = [];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
          //padding: padding,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              child: Text('satır grafiği'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Grafik(information: infos,)
                    ),
              ),
            ),
            ElevatedButton(
              child: Text('pasta grafik'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => pieChart(
                          information: infos,
                        )),
              ),
            ),
          ]),
    );
  }
}
*/