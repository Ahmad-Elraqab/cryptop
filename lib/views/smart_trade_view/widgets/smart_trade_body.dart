import 'package:cryptop/components/title_header/title_header.dart';
import 'package:cryptop/models/smart_trade_model.dart';
import 'package:cryptop/views/smart_trade_view/widgets/smart_trade_header.dart';
import 'package:cryptop/views/smart_trade_view/widgets/smart_trade_list.dart';
import 'package:flutter/material.dart';

class SmartTradeBody extends StatelessWidget {
  const SmartTradeBody({
    Key? key,
    this.activeIndex,
    this.setIndex,
    this.smartTradeList,
    this.dataType,
  }) : super(key: key);
  final List? dataType;
  final List<SmartTradeModel>? smartTradeList;
  final int? activeIndex;
  final Function? setIndex;
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
        SmartTradeHeader(dataType: dataType),
        SmartTradeList(
          activeIndex: activeIndex,
          setIndex: setIndex,
          smartTradeList: smartTradeList,
        ),
      ],
    );
  }
}
