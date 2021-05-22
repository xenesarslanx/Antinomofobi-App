import 'dart:convert';

import 'package:antinomofobi/grafikler/grafik_data.dart';
import 'package:app_usage/app_usage.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class pieChart extends StatefulWidget {
  final List<AppUsageInfo> information;

  const pieChart({Key key, this.information});

  @override
  _pieChartState createState() => _pieChartState();
}

class _pieChartState extends State<pieChart> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text('Grafik'),
              actions: [],
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
                          desiredMaxRows: 8,
                          cellPadding: EdgeInsets.only(
                          right: 5.0, left: 5, bottom: 5.0, top: 5.0),
                          entryTextStyle: charts.TextStyleSpec(
                            
                              color: charts.MaterialPalette.purple.shadeDefault,
                              fontFamily: 'Georgia',
                              fontSize: 8),
                             ),
                          
                        ],
                    defaultRenderer: new charts.ArcRendererConfig(
                        arcWidth: 70,
                        arcRendererDecorators: [
                          new charts.ArcLabelDecorator(
                            labelPosition: charts.ArcLabelPosition.outside,
                            showLeaderLines: true,
                            labelPadding: 5,
                          )
                        ]),
                  ),
                )
              ],
            )));
  }
}
