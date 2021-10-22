import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class IstatistiklerStatic {
  /// Returns the spline types chart.
  static SfCartesianChart buildTypesSplineChart() {
    return SfCartesianChart(
      enableSideBySideSeriesPlacement: false,
      title: ChartTitle(text: 'Kullanıcı Sayısı'),
      series: _getSplineTypesSeries(),
      borderWidth: 5,
    );
  }

  static Widget buildCPUDataChart({required BuildContext context}) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(5),
            height: 500,
            width: 500,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10)),
                  Expanded(
                      child: SfSparkAreaChart(
                    data: cpuData,
                    axisLineWidth: 0,
                    color: const Color.fromRGBO(184, 71, 189, 0.35),
                    borderColor: const Color.fromRGBO(184, 71, 189, 1),
                    borderWidth: 5,
                  ))
                ]),
          ),
        ]);
  }

  static List<double> cpuData = const <double>[20, 19, 39, 25, 11, 28, 34, 28];
  static List<SplineSeries<_ChartData, num>> _getSplineTypesSeries() {
    final List<_ChartData> chartData = <_ChartData>[
      _ChartData(2011, 0.05),
      _ChartData(2011.25, 0),
      _ChartData(2011.50, 0.03),
      _ChartData(2011.75, 0),
      _ChartData(2012, 0.04),
      _ChartData(2012.25, 0.02),
      _ChartData(2012.50, -0.01),
      _ChartData(2012.75, 0.01),
      _ChartData(2013, -0.08),
      _ChartData(2013.25, -0.02),
      _ChartData(2013.50, 0.03),
      _ChartData(2013.75, 0.05),
      _ChartData(2014, 0.04),
      _ChartData(2014.25, 0.02),
      _ChartData(2014.50, 0.04),
      _ChartData(2014.75, 0),
      _ChartData(2015, 0.02),
      _ChartData(2015.25, 0.10),
      _ChartData(2015.50, 0.09),
      _ChartData(2015.75, 0.11),
      _ChartData(2016, 0.12),
    ];
    return <SplineSeries<_ChartData, num>>[
      SplineSeries<_ChartData, num>(

          /// To set the spline type here.
          splineType: SplineType.natural,
          dataSource: chartData,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y,
          color: Colors.purple,
          width: 4)
    ];
  }

  static SfCircularChart buildDefaultPieChart() {
    return SfCircularChart(
      title: ChartTitle(text: 'Sales by sales person'),
      legend: Legend(isVisible: true),
      series: _getDefaultPieSeries(),
    );
  }

  /// Returns the pie series.
  static List<PieSeries<ChartSampleData, String>> _getDefaultPieSeries() {
    final List<ChartSampleData> pieData = <ChartSampleData>[
      ChartSampleData(x: 'David', y: 13, text: 'David \n 13%'),
      ChartSampleData(x: 'Steve', y: 24, text: 'Steve \n 24%'),
      ChartSampleData(x: 'Jack', y: 25, text: 'Jack \n 25%'),
      ChartSampleData(x: 'Others', y: 38, text: 'Others \n 38%'),
    ];
    return <PieSeries<ChartSampleData, String>>[
      PieSeries<ChartSampleData, String>(
          explode: true,
          explodeIndex: 0,
          explodeOffset: '10%',
          dataSource: pieData,
          xValueMapper: (ChartSampleData data, _) => data.x,
          yValueMapper: (ChartSampleData data, _) => data.y,
          dataLabelMapper: (ChartSampleData data, _) => data.text,
          startAngle: 90,
          endAngle: 90,
          dataLabelSettings: const DataLabelSettings(isVisible: true)),
    ];
  }

  /// Returns the circular chart with radial series.
  static SfCircularChart buildDefaultRadialBarChart() {
    return SfCircularChart(
        key: GlobalKey(),
        title: ChartTitle(text: 'Shot put distance'),
        series: _getRadialBarDefaultSeries(),
        tooltipBehavior: TooltipBehavior(
          enable: true,
          format: 'point.x : point.ym',
        ));
  }

  /// Returns default radial series.
  static List<RadialBarSeries<ChartSampleData, String>>
      _getRadialBarDefaultSeries() {
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(
          x: 'John',
          y: 10,
          text: '100%',
          pointColor: const Color.fromRGBO(248, 177, 149, 1.0)),
      ChartSampleData(
          x: 'Almaida',
          y: 11,
          text: '100%',
          pointColor: const Color.fromRGBO(246, 114, 128, 1.0)),
      ChartSampleData(
          x: 'Don',
          y: 12,
          text: '100%',
          pointColor: const Color.fromRGBO(61, 205, 171, 1.0)),
      ChartSampleData(
          x: 'Tom',
          y: 13,
          text: '100%',
          pointColor: const Color.fromRGBO(1, 174, 190, 1.0)),
    ];
    return <RadialBarSeries<ChartSampleData, String>>[
      RadialBarSeries<ChartSampleData, String>(
          maximumValue: 15,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, textStyle: TextStyle(fontSize: 10.0)),
          dataSource: chartData,
          cornerStyle: CornerStyle.bothCurve,
          gap: '10%',
          radius: '90%',
          xValueMapper: (ChartSampleData data, _) => data.x ,
          yValueMapper: (ChartSampleData data, _) => data.y,
          pointRadiusMapper: (ChartSampleData data, _) => data.text,
          pointColorMapper: (ChartSampleData data, _) => data.pointColor,
          dataLabelMapper: (ChartSampleData data, _) => data.x )
    ];
  }
}

/// Private class for storing the spline series data points.
class _ChartData {
  _ChartData(this.x, this.y);
  final double x;
  final double y;
}

/// Private class for storing the spline series data points.
class ChartSampleData {
  ChartSampleData(
      {required this.x, required this.y, required this.text, this.pointColor});
  final String x;
  final double y;
  final String text;
  Color? pointColor;
}
