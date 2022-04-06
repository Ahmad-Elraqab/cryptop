import 'package:cryptop/views/payment_view/widgets/payment_body.dart';
import 'package:flutter/material.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({Key? key}) : super(key: key);

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  bool _switch = false;
  setSwitch(value) => setState(() => {_switch = value});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromRGBO(55, 61, 76, 1),
          height: MediaQuery.of(context).size.height,
          child: PaymentBody(
            switchState: _switch,
            setState: setSwitch,
          ),
        ),
      ),
    );
  }
}
