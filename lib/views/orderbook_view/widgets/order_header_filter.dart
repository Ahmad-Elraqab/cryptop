import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/views/orderbook_view/widgets/order_bottom_sheet.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_buttom/custom_button.dart';

class OrderHeaderFilter extends StatelessWidget {
  const OrderHeaderFilter({
    Key? key,
    this.filter,
  }) : super(key: key);

  final Function? filter;
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
              title: 'Order List',
              weight: FontWeight.bold,
            ),
          ],
        ),
        Row(
          children: [
            CustomButtom(
              borderColor: Colors.transparent,
              borderRadius: 5.0,
              buttonColor: const Color.fromRGBO(55, 61, 76, 1),
              buttonText: 'Close All',
              buttonTextColor: Colors.white,
              fontSize: 12,
              hasImage: false,
              height: 30.0,
              horizontal: 10.0,
              vertical: 4.0,
              imageUrl: '',
              onTap: () => showBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => OrderBottomSheet(filter: filter),
              ),
            ),
            const SizedBox(width: 15.0),
            CustomButtom(
              borderColor: Colors.transparent,
              borderRadius: 5.0,
              buttonColor: const Color.fromRGBO(55, 61, 76, 1),
              buttonText: 'Filter',
              buttonTextColor: Colors.white,
              fontSize: 12,
              hasImage: false,
              height: 30.0,
              horizontal: 10.0,
              vertical: 4.0,
              imageUrl: '',
              onTap: () => showBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => OrderBottomSheet(filter: filter),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
