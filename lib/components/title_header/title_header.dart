import 'package:cryptop/components/text_component/text_component.dart';
import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget {
  const TitleHeader({
    Key? key,
    this.title,
    this.isTitle,
  }) : super(key: key);

  final String? title;
  final bool? isTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () => {},
                  icon: const Icon(
                    Icons.reply,
                    size: 26,
                    color: Colors.amber,
                  ),
                ),
              ),
              Expanded(
                flex: isTitle == true ? 8 : 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 10.0,
                      width: 10.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    TextComponent(
                      align: TextAlign.center,
                      fontSize: 14,
                      line: 1,
                      textColor: Colors.white,
                      title: title!,
                      weight: FontWeight.bold,
                    ),
                    const SizedBox(width: 15.0),
                    Container(
                      height: 10.0,
                      width: 10.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ],
                ),
              ),
              isTitle == true
                  ? Expanded(flex: 1, child: Container())
                  : Expanded(
                      flex: 1,
                      child: Row(
                        children: const [
                          Icon(
                            Icons.alarm,
                            color: Colors.white,
                            size: 25.0,
                          ),
                          SizedBox(width: 20.0),
                          Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 25.0,
                          ),
                        ],
                      ),
                    ),
            ],
          ),
          const Divider(
            height: 1,
            color: Colors.white,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
