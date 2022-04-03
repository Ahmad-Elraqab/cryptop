import 'package:cryptop/components/text_component/text_component.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomIncrementalButton extends StatelessWidget {
  const CustomIncrementalButton({
    Key? key,
    this.title,
    this.onClick,
  }) : super(key: key);

  final String? title;
  final Function? onClick;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () => onClick!('-'),
              icon: const Icon(
                FontAwesomeIcons.minus,
                size: 16,
              )),
          TextComponent(
            align: TextAlign.center,
            fontSize: 14,
            line: 1,
            title: title!,
            weight: FontWeight.bold,
            textColor: Colors.black,
          ),
          IconButton(
            onPressed: () => onClick!('+'),
            icon: const Icon(
              FontAwesomeIcons.plus,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
