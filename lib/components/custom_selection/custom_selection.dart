import 'package:cryptop/components/text_component/text_component.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSelection extends StatelessWidget {
  final String? title;
  final int? index;
  final bool? isActive;
  final Function? onClick;

  const CustomSelection({
    Key? key,
    this.title,
    this.isActive,
    this.onClick,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick!(index!),
      child: Container(
        height: 50.0,
        padding: const EdgeInsets.only(right: 20.0, left: 20.0),
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextComponent(
              align: TextAlign.start,
              fontSize: 16,
              line: 1,
              textColor: Colors.black,
              title: title!,
              weight: FontWeight.w600,
            ),
            isActive! == true
                ? const Icon(
                    FontAwesomeIcons.check,
                    size: 16,
                    color: Colors.black,
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
