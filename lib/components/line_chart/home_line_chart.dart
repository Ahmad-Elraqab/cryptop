import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomeLineChart extends StatelessWidget {
  const HomeLineChart({
    Key? key,
    this.padding = 50.0,
  }) : super(key: key);

  final double? padding;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.all(padding!),
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
                  checkToShowDot: (FlSpot point, LineChartBarData data) {
                    if (point == const FlSpot(0, 1) ||
                        point == const FlSpot(8, 20)) {
                      return true;
                    }
                    return false;
                  },
                ),
                spots: [
                  const FlSpot(0, 1),
                  const FlSpot(1, 3),
                  const FlSpot(2, 10),
                  const FlSpot(3, 7),
                  const FlSpot(4, 12),
                  const FlSpot(5, 13),
                  const FlSpot(6, 17),
                  const FlSpot(7, 15),
                  const FlSpot(8, 20)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
