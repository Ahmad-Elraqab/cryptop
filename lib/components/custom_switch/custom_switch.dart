import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rolling_switch/rolling_switch.dart';
import '../text_component/text_component.dart';

class CustomSwitch extends StatelessWidget {
  final String? title;
  final bool? state;
  final Function? setState;

  const CustomSwitch({
    Key? key,
    this.title,
    this.state,
    this.setState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      padding: const EdgeInsets.only(right: 5.0, left: 15.0),
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: RollingSwitch.icon(
              initialState: state!,
              width: 100.0,
              onChanged: (bool value) => setState!(value),
              rollingInfoRight: const RollingIconInfo(
                text: Text(''),
                backgroundColor: Colors.green,
              ),
              rollingInfoLeft: const RollingIconInfo(
                backgroundColor: Colors.grey,
                text: Text(''),
                // ignore: deprecated_member_use
                icon: FontAwesomeIcons.times,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
