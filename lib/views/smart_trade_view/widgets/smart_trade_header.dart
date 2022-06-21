import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/views/smart_trade_view/widgets/smart_trade_bottom_sheet.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_buttom/custom_button.dart';

class SmartTradeHeader extends StatelessWidget {
  const SmartTradeHeader({
    Key? key,
    this.filter,
    this.symbols,
    this.dataType,
  }) : super(key: key);
  final List? dataType;

  final Function? filter;
  final List? symbols;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50.0),
              ),
              height: 10.0,
              width: 10.0,
            ),
            const SizedBox(width: 10.0),
            const TextComponent(
              align: TextAlign.start,
              fontSize: 14.0,
              line: 1,
              textColor: Colors.white,
              title: 'Smart Trade List',
              weight: FontWeight.bold,
            ),
          ],
        ),
        CustomButtom(
          borderColor: Colors.transparent,
          borderRadius: 5.0,
          buttonText: 'Create',
          buttonColor: Colors.grey,
          buttonTextColor: Colors.white,
          fontSize: 12,
          hasImage: false,
          height: 30.0,
          horizontal: 10.0,
          vertical: 4.0,
          imageUrl: '',
          onTap: () => {
            showBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) => Container(
                padding: const EdgeInsets.all(24.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    topLeft: Radius.circular(15.0),
                  ),
                  color: Color.fromARGB(255, 39, 44, 56),
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
                child: SmartTradeBottomSheet(
                    dataType: dataType!.map((e) => e['type']).toList()),
              ),
            ),
          },
        ),
      ],
    );
  }
}
