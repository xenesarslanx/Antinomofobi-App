import 'package:antinomofobi/bilgi_page.dart';
import 'package:antinomofobi/grafikler/grafik.dart';
import 'package:antinomofobi/grafikler/grafik_data.dart';
import 'package:app_usage/app_usage.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class pieChart extends StatefulWidget {
  final List<AppUsageInfo> information;

  const pieChart({Key key, this.information});

  @override
  pieChartState createState() => pieChartState();
}

class pieChartState extends State<pieChart> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text('Grafik'),
             actions: [
               IconButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => bilgi()),
                ),
                icon: new Icon(Icons.graphic_eq_rounded),
              ),
        ],
            ),
            body: Column(
              children: <Widget>[
                Expanded(
                  child: charts.PieChart(
                    getSeriesData(widget.information),
                    animate: false,
                    behaviors: [
                      //     SlidingViewport(),
                      //   charts.PanAndZoomBehavior(),
                     charts.DatumLegend(

                          showMeasures: true,
                          outsideJustification:
                          charts.OutsideJustification.startDrawArea,
                          horizontalFirst: false,
                          desiredMaxRows: 10,
                          desiredMaxColumns: 2,
                          cellPadding: EdgeInsets.only(
                          right: 5.0, left: 2, bottom: 5.0, top: 5.0),
                          entryTextStyle: charts.TextStyleSpec(
                            
                              color: charts.MaterialPalette.purple.shadeDefault,
                              fontFamily: 'Georgia',
                              fontSize: 8),
                             ),
                          
                        ],
                    defaultRenderer: new charts.ArcRendererConfig(
                        arcWidth: 100,
                        arcRendererDecorators: [
                          new charts.ArcLabelDecorator(
                            labelPosition: charts.ArcLabelPosition.inside,
                            insideLabelStyleSpec: charts.TextStyleSpec(fontSize: 7, color: 
           charts.Color.fromHex(code: "#FFFFFF")
           
           )
           ),
                            //labelPadding: 5,
                          
                        ]),
                  ),
                  
                ),
                
                
              ],
            )));
  }
  Grafik graf = Grafik();
  GrafikState grafs = GrafikState();
}
