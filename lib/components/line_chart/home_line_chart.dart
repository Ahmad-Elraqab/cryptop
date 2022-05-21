import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomeLineChart extends StatelessWidget {
  const HomeLineChart({
    Key? key,
    this.padding = 30.0,
    this.color = Colors.transparent,
    this.data,
  }) : super(key: key);

  final double? padding;
  final Color? color;
  final List<FlSpot>? data;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.only(bottom: 10.0),
        height: 50,
        color: color,
        width: MediaQuery.of(context).size.width * 0.5,
        child: LineChart(
          LineChartData(
            titlesData: FlTitlesData(
              show: false,
            ),
            gridData: FlGridData(
              show: false,
            ),
            lineTouchData: LineTouchData(
              enabled: false,
            ),
            backgroundColor: Colors.transparent,
            borderData: FlBorderData(
              show: false,
              border: Border.all(
                color: Colors.transparent,
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                color: Colors.white,
                isCurved: true,
                dotData: FlDotData(
                  checkToShowDot: (FlSpot point, LineChartBarData _data) {
                    if (point == data![0] || point == data![data!.length - 1]) {
                      return true;
                    }
                    return false;
                  },
                ),
                spots: data,
              )
            ],
          ),
        ),
      ),
    );
  }
}
