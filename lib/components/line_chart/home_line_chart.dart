import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomeLineChart extends StatelessWidget {
  const HomeLineChart({
    Key? key,
    this.padding = null,
    this.color = Colors.transparent,
    this.data,
    this.height = 50,
    this.width,
  }) : super(key: key);

  final double? height;
  final double? width;
  final double? padding;
  final Color? color;
  final List<FlSpot>? data;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: padding == null
            ? const EdgeInsets.only(bottom: 10.0)
            : EdgeInsets.all(padding!),
        height: height,
        color: color,
        width: width,
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
                    if (point.x == data![0].x ||
                        point.x == data![data!.length - 1].x && data != null) {
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
