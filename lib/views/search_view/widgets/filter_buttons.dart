import 'package:cryptop/components/text_component/text_component.dart';
import 'package:flutter/material.dart';

class FilterButtons extends StatelessWidget {
  const FilterButtons({
    Key? key,
    this.setFilter,
    this.filter,
  }) : super(key: key);
  final Function? setFilter;
  final String? filter;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => setFilter!(filter == 'N_UP' ? 'N_DOWN' : 'N_UP'),
          child: Row(
            children: [
              TextComponent(
                align: TextAlign.start,
                fontSize: 12.0,
                line: 1,
                textColor: filter == 'N_UP' || filter == 'N_DOWN'
                    ? Colors.amberAccent
                    : Colors.white70,
                title: 'Name',
                weight: FontWeight.bold,
              ),
              SizedBox(
                width: 5.0,
              ),
              Icon(
                filter == 'N_UP'
                    ? Icons.arrow_upward_sharp
                    : filter == 'N_DOWN'
                        ? Icons.arrow_downward_sharp
                        : Icons.arrow_downward_sharp,
                size: 14,
                color: filter == 'N_UP' || filter == 'N_DOWN'
                    ? Colors.amberAccent
                    : Colors.white70,
              ),
            ],
          ),
        ),
        Row(
          children: [
            InkWell(
              onTap: () => setFilter!(filter == 'V_UP' ? 'V_DOWN' : 'V_UP'),
              child: Row(
                children: [
                  TextComponent(
                    align: TextAlign.start,
                    fontSize: 12.0,
                    line: 1,
                    textColor: filter == 'V_UP' || filter == 'V_DOWN'
                        ? Colors.amberAccent
                        : Colors.white70,
                    title: 'Vol',
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Icon(
                    filter == 'V_UP'
                        ? Icons.arrow_upward_sharp
                        : filter == 'V_DOWN'
                            ? Icons.arrow_downward_sharp
                            : Icons.arrow_downward_sharp,
                    size: 14,
                    color: filter == 'V_UP' || filter == 'V_DOWN'
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
              onTap: () => setFilter!(filter == 'C_UP' ? 'C_DOWN' : 'C_UP'),
              child: Row(
                children: [
                  TextComponent(
                    align: TextAlign.start,
                    fontSize: 12.0,
                    line: 1,
                    textColor: filter == 'C_UP' || filter == 'C_DOWN'
                        ? Colors.amberAccent
                        : Colors.white70,
                    title: '24 Change',
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Icon(
                    filter == 'C_UP'
                        ? Icons.arrow_upward_sharp
                        : filter == 'C_DOWN'
                            ? Icons.arrow_downward_sharp
                            : Icons.arrow_downward_sharp,
                    size: 14,
                    color: filter == 'C_UP' || filter == 'C_DOWN'
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
