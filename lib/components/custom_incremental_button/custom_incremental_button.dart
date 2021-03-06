import 'package:cryptop/components/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomIncrementalButton extends StatelessWidget {
  const CustomIncrementalButton({
    Key? key,
    this.title,
    this.controller,
    this.type,
    this.onChange,
    this.price,
  }) : super(key: key);

  final Function? onChange;
  final double? price;
  final String? title;
  final TextEditingController? controller;
  final int? type;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () => onChange!(controller, '-', price, type: type),
              icon: const Icon(
                FontAwesomeIcons.minus,
                size: 16,
              )),
          Expanded(
            child: CustomerTextField(
              borderColor: Colors.white,
              color: Colors.black,
              keyboardType: TextInputType.number,
              error: 'Invalid Value',
              labelText: title,
              lines: 1,
              textAlign: TextAlign.center,
              onChanged: (value) =>
                  onChange!(controller, '&', price, value: value, type: type),
              readonly: false,
              secure: false,
              validate: false,
              controller: controller,
            ),
          ),
          IconButton(
            onPressed: () => onChange!(controller, '+', price, type: type),
            icon: const Icon(
              FontAwesomeIcons.plus,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
