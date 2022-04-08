import 'package:cryptop/components/custom_buttom/custom_button.dart';
import 'package:flutter/material.dart';

class OrderBottomSheet extends StatelessWidget {
  const OrderBottomSheet({
    Key? key,
    this.filter,
  }) : super(key: key);
  final Function? filter;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      height: 200.0,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(55, 61, 76, 1),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(138, 0, 0, 0),
            blurRadius: 10.0,
            offset: Offset(10, 0),
            spreadRadius: 20.0,
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomButtom(
            borderColor: Colors.transparent,
            borderRadius: 5.0,
            buttonColor: Colors.transparent,
            buttonText: 'Filter By Date',
            buttonTextColor: Colors.white,
            fontSize: 12,
            hasImage: false,
            height: 30.0,
            horizontal: 10.0,
            vertical: 4.0,
            imageUrl: '',
            onTap: () => filter!(),
          ),
          const Divider(
            color: Colors.white,
            height: 5.0,
            thickness: 1,
            indent: 30.0,
            endIndent: 30.0,
          ),
          CustomButtom(
            borderColor: Colors.transparent,
            borderRadius: 5.0,
            buttonColor: Colors.transparent,
            buttonText: 'Filter By Rate',
            buttonTextColor: Colors.white,
            fontSize: 12,
            hasImage: false,
            height: 30.0,
            horizontal: 10.0,
            vertical: 4.0,
            imageUrl: '',
            onTap: () => filter!(),
          ),
          const Divider(
            color: Colors.white,
            height: 5.0,
            thickness: 1,
            indent: 30.0,
            endIndent: 30.0,
          ),
          CustomButtom(
            borderColor: Colors.transparent,
            borderRadius: 5.0,
            buttonColor: Colors.transparent,
            buttonText: 'Filter By Amount',
            buttonTextColor: Colors.white,
            fontSize: 12,
            hasImage: false,
            height: 30.0,
            horizontal: 10.0,
            vertical: 4.0,
            imageUrl: '',
            onTap: () => filter!(),
          ),
        ],
      ),
    );
  }
}
