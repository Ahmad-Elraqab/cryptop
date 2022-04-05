import 'dart:async';

import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/components/line_chart/home_line_chart.dart';
import 'package:cryptop/views/home_view/widgets/home_line_chart_details.dart';
import 'package:cryptop/views/home_view/widgets/home_line_chart_slider.dart';
import 'package:flutter/material.dart';

class PairBoard extends StatelessWidget {
  const PairBoard({
    this.opacity_,
    this.activeBoard,
    this.setOpacity,
    Key? key,
    this.loading,
  }) : super(key: key);

  final double? opacity_;
  final bool? loading;
  final int? activeBoard;
  final Function? setOpacity;

  @override
  Widget build(BuildContext context) {
    // if (loading == true) setOpacity!(0);
    return Column(
      children: [
        Container(
          height: 50.0,
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextComponent(
                align: TextAlign.start,
                fontSize: 14.0,
                line: 1,
                textColor: Colors.black,
                title: 'Market Update',
                weight: FontWeight.w600,
              ),
              InkWell(
                onTap: () => {},
                child: const TextComponent(
                  align: TextAlign.start,
                  fontSize: 14.0,
                  line: 1,
                  textColor: Colors.black,
                  title: 'See all',
                  weight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 200.0,
          color: const Color.fromRGBO(36, 36, 43, 1),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: opacity_!,
            onEnd: () => Future.delayed(
              Duration(milliseconds: opacity_ == 0 ? 500 : 5000),
            ).then(
              (value) => setOpacity!(opacity_ == 1 ? 0 : 1),
            ),
            child: Stack(
              children: [
                const HomeLineChart(),
                const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 24.0),
                    child: TextComponent(
                      align: TextAlign.center,
                      fontSize: 16.0,
                      line: 1,
                      textColor: Color.fromARGB(255, 35, 136, 41),
                      title: '47,350.89',
                      weight: FontWeight.bold,
                    ),
                  ),
                ),
                const HomeLineChartDetails(),
                HomeLineChartSlider(activeBoard: activeBoard!)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
