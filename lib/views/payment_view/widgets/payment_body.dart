import 'package:cryptop/components/custom_switch/custom_switch.dart';
import 'package:cryptop/components/custom_top_bar/custom_top_bar.dart';
import 'package:flutter/material.dart';

class PaymentBody extends StatelessWidget {
  const PaymentBody({Key? key, this.switchState, this.setState})
      : super(key: key);

  final bool? switchState;
  final Function? setState;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTopBar(),
        const SizedBox(height: 50.0),
        CustomSwitch(
          state: switchState,
          title: 'Credit Card',
          setState: setState,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Divider(
            color: Colors.white,
            thickness: 1,
            height: 100,
          ),
        ),
      ],
    );
  }
}
