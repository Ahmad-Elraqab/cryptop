import 'package:cryptop/views/smart_trade_view/widgets/smart_trade_body.dart';
import 'package:flutter/material.dart';

class SmartTradeView extends StatefulWidget {
  const SmartTradeView({Key? key}) : super(key: key);

  @override
  State<SmartTradeView> createState() => _SmartTradeViewState();
}

class _SmartTradeViewState extends State<SmartTradeView> {
  int? activeIndex;
  setIndex(value) => setState(() => {activeIndex = value});
  create() => {};
  edit() => {};
  delete() => {};
  status() => {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          color: const Color.fromRGBO(55, 61, 76, 1),
          child: SmartTradeBody(
            activeIndex: activeIndex,
            create: create,
            delete: delete,
            edit: edit,
            setIndex: setIndex,
            status: status,
          ),
        ),
      ),
    );
  }
}