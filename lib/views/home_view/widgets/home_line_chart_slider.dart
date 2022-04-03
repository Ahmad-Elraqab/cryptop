import 'package:flutter/material.dart';

class HomeLineChartSlider extends StatelessWidget {
  const HomeLineChartSlider({
    Key? key,
    this.activeBoard,
  }) : super(key: key);

  final int? activeBoard;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i < 7; i++)
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
