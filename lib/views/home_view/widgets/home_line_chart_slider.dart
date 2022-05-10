import 'package:flutter/material.dart';

class HomeLineChartSlider extends StatelessWidget {
  const HomeLineChartSlider({
    Key? key,
    this.activeBoard,
    this.length,
  }) : super(key: key);

  final int? activeBoard;
  final int? length;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.only(right: 15.0, left: 15.0, bottom: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i < length!; i++)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                height: i == activeBoard ? 20 : 10,
                width: i == activeBoard ? 20 : 10,
                decoration: BoxDecoration(
                  color: i == activeBoard ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(50.0),
                  border: Border.all(
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
