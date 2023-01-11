import 'package:cryptop/components/text_component/text_component.dart';
import 'package:flutter/material.dart';

class OrderHeaderFilter extends StatelessWidget {
  const OrderHeaderFilter({
    Key? key,
    this.filter,
    this.setFilter,
  }) : super(key: key);

  final String? filter;
  final Function? setFilter;
  @override
  Widget build(BuildContext context) {
    final list = ['Date', 'Name', 'Amount', 'Pending'];
    final actionList = ['D', 'N', 'A', 'P'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (var i = 0; i < list.length; i++)
              InkWell(
                onTap: () => setFilter!((actionList[i] + '_UP') == filter
                    ? (actionList[i] + '_DOWN')
                    : (actionList[i] + '_UP')),
                child: Row(
                  children: [
                    TextComponent(
                      align: TextAlign.start,
                      fontSize: 9.0,
                      line: 1,
                      textColor: filter == (actionList[i] + '_UP') ||
                              filter == (actionList[i] + '_DOWN')
                          ? Colors.amberAccent
                          : Colors.white70,
                      title: list[i],
                      weight: FontWeight.bold,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      filter == (actionList[i] + '_UP')
                          ? Icons.arrow_upward_sharp
                          : filter == (actionList[i] + '_DOWN')
                              ? Icons.arrow_downward_sharp
                              : Icons.arrow_downward_sharp,
                      size: 9,
                      color: filter == (actionList[i] + '_UP') ||
                              filter == (actionList[i] + '_DOWN')
                          ? Colors.amberAccent
                          : Colors.white70,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                  ],
                ),
              ),
          ],
        ),
        InkWell(
          onTap: () => {},
          child: Row(
            children: [
              TextComponent(
                align: TextAlign.start,
                fontSize: 9.0,
                line: 1,
                textColor: Colors.amberAccent,
                title: 'Close All',
                weight: FontWeight.bold,
              ),
              SizedBox(
                width: 5.0,
              ),
              Icon(
                Icons.watch_later_outlined,
                size: 9,
                color: Colors.amberAccent,
              ),
              SizedBox(
                width: 15.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
