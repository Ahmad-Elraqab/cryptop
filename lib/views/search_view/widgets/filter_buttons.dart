import 'package:cryptop/components/text_component/text_component.dart';
import 'package:flutter/material.dart';

class FilterButtons extends StatelessWidget {
  const FilterButtons({
    Key? key,
    this.setFilter,
    this.filter,
  }) : super(key: key);
  final Function? setFilter;
  final Map? filter;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => setFilter!(1),
          child: Row(
            children: [
              TextComponent(
                align: TextAlign.start,
                fontSize: 12.0,
                line: 1,
                textColor:
                    filter!['index'] == 1 ? Colors.amberAccent : Colors.white70,
                title: 'Name',
                weight: FontWeight.bold,
              ),
              SizedBox(
                width: 5.0,
              ),
              Icon(
                filter!['index'] == 1 && filter!['value'] == false
                    ? Icons.keyboard_double_arrow_up_sharp
                    : Icons.keyboard_double_arrow_down_sharp,
                size: 14,
                color:
                    filter!['index'] == 1 ? Colors.amberAccent : Colors.white70,
              ),
            ],
          ),
        ),
        Row(
          children: [
            InkWell(
              onTap: () => setFilter!(2),
              child: Row(
                children: [
                  TextComponent(
                    align: TextAlign.start,
                    fontSize: 12.0,
                    line: 1,
                    textColor: filter!['index'] == 2
                        ? Colors.amberAccent
                        : Colors.white70,
                    title: 'Vol',
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Icon(
                    filter!['index'] == 2 && filter!['value'] == false
                        ? Icons.keyboard_double_arrow_up_sharp
                        : Icons.keyboard_double_arrow_down_sharp,
                    size: 14,
                    color: filter!['index'] == 2
                        ? Colors.amberAccent
                        : Colors.white70,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            InkWell(
              onTap: () => setFilter!(3),
              child: Row(
                children: [
                  TextComponent(
                    align: TextAlign.start,
                    fontSize: 12.0,
                    line: 1,
                    textColor: filter!['index'] == 3
                        ? Colors.amberAccent
                        : Colors.white70,
                    title: '24 Change',
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Icon(
                    filter!['index'] == 3 && filter!['value'] == false
                        ? Icons.keyboard_double_arrow_up_sharp
                        : Icons.keyboard_double_arrow_down_sharp,
                    size: 14,
                    color: filter!['index'] == 3
                        ? Colors.amberAccent
                        : Colors.white70,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
