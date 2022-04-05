import 'package:cryptop/components/text_component/text_component.dart';
import 'package:flutter/material.dart';

class CoinDetail extends StatelessWidget {
  const CoinDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            flex: 4,
            child: ListTile(
              contentPadding: EdgeInsets.all(0.0),
              horizontalTitleGap: 0.0,
              trailing: Icon(
                Icons.percent_outlined,
                color: Color.fromARGB(188, 94, 242, 212),
                size: 55.0,
              ),
              title: TextComponent(
                align: TextAlign.end,
                fontSize: 22,
                line: 1,
                textColor: Color.fromARGB(255, 250, 131, 125),
                title: '41,452.65',
                weight: FontWeight.bold,
              ),
              subtitle: TextComponent(
                align: TextAlign.end,
                fontSize: 16,
                line: 1,
                textColor: Color.fromARGB(188, 94, 242, 212),
                title: '2.37',
                weight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(children: [
              for (var i = 0; i < 3; i++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextComponent(
                      align: TextAlign.end,
                      fontSize: 10,
                      line: 1,
                      textColor: Colors.white,
                      title: 'High : 41,300.56',
                      weight: FontWeight.bold,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 7,
                      ),
                      height: 5.0,
                      width: 5.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    const TextComponent(
                      align: TextAlign.end,
                      fontSize: 10,
                      line: 1,
                      textColor: Colors.white,
                      title: 'Close : 41,300.56',
                      weight: FontWeight.bold,
                    ),
                  ],
                )
            ]),
          ),
        ],
      ),
    );
  }
}
