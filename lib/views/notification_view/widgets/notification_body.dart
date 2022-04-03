import 'package:cryptop/components/custom_switch/custom_switch.dart';
import 'package:cryptop/components/custom_top_bar/custom_top_bar.dart';
import 'package:flutter/material.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody(
      {Key? key,
      this.stateSwitch,
      this.stateSwitch2,
      this.stateSwitch3,
      this.stateSwitch4})
      : super(key: key);
  final Function? stateSwitch;
  final Function? stateSwitch2;
  final Function? stateSwitch3;
  final Function? stateSwitch4;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTopBar(),
        const SizedBox(height: 50.0),
        CustomSwitch(
            title: 'Show notification', state: true, setState: stateSwitch),
        const SizedBox(height: 10.0),
        CustomSwitch(
          title: 'Allow notification dot',
          state: false,
          setState: stateSwitch2,
        ),
        const SizedBox(height: 30.0),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Divider(color: Colors.white, height: 1, thickness: 2),
        ),
        const SizedBox(height: 30.0),
        CustomSwitch(
          title: 'Executive program',
          state: false,
          setState: stateSwitch3,
        ),
        const SizedBox(height: 10.0),
        CustomSwitch(
          title: 'Discount & deals',
          state: true,
          setState: stateSwitch4,
        ),
      ],
    );
  }
}
