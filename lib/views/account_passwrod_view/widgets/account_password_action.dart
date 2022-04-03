import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountPasswordAction extends StatelessWidget {
  final Function? onClick;
  final bool? editable;
  const AccountPasswordAction({
    Key? key,
    this.onClick,
    this.editable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: IconButton(
              onPressed: () => onClick!(!editable!),
              icon: const Icon(
                FontAwesomeIcons.check,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: IconButton(
              onPressed: () => onClick!(!editable!),
              icon: const Icon(
                // ignore: deprecated_member_use
                FontAwesomeIcons.times,
                color: Colors.white,
                size: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
