import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CircularChart extends StatelessWidget {
  const CircularChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('David', 100, const Color.fromRGBO(9, 0, 136, 1)),
      ChartData('Steve', 38, const Color.fromRGBO(147, 0, 119, 1)),
      ChartData('Jack', 34, const Color.fromRGBO(228, 0, 124, 1)),
      ChartData('Others', 52, const Color.fromRGBO(255, 189, 57, 1))
    ];
    return SfCircularChart(
      series: <CircularSeries>[
        DoughnutSeries<ChartData, String>(
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          explode: true,
          explodeAll: false,
          innerRadius: '80%',
          dataLabelSettings: const DataLabelSettings(
            labelPosition: ChartDataLabelPosition.outside,
            isVisible: true,
            color: Colors.white,
            textStyle: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}