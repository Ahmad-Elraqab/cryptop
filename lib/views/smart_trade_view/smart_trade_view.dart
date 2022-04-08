import 'package:cryptop/components/title_header/title_header.dart';
import 'package:cryptop/views/smart_trade_view/widgets/smart_trade_header.dart';
import 'package:cryptop/views/smart_trade_view/widgets/smart_trade_list.dart';
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
          child: Column(
            children: [
              const SizedBox(
                height: 30.0,
              ),
              const TitleHeader(
                isTitle: true,
                title: 'Smart Trade List',
              ),
              const SizedBox(height: 20.0),
              SmartTradeHeader(filter: create),
              SmartTradeList(
                activeIndex: activeIndex,
                setIndex: setIndex,
                edit: edit,
                delete: delete,
                status: status,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
