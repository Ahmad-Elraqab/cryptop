import 'package:cryptop/components/title_header/title_header.dart';
import 'package:cryptop/views/smart_trade_view/widgets/smart_trade_header.dart';
import 'package:cryptop/views/smart_trade_view/widgets/smart_trade_list.dart';
import 'package:flutter/material.dart';

class SmartTradeBody extends StatelessWidget {
  const SmartTradeBody(
      {Key? key,
      this.activeIndex,
      this.setIndex,
      this.create,
      this.edit,
      this.delete,
      this.status})
      : super(key: key);
  final int? activeIndex;
  final Function? setIndex;
  final Function? create;
  final Function? edit;
  final Function? delete;
  final Function? status;
  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}