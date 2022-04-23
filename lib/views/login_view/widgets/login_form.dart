import 'package:cryptop/components/custom_text_field/custom_text_field.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final List<String>? labels;
  final List<TextEditingController>? controller;
  final List<Map<String, Object>>? validators;
  final bool? checkBoxController;
  final Function? onchanged;
  final Function? onclick;

  const LoginForm({
    Key? key,
    this.labels,
    this.controller,
    this.validators,
    this.checkBoxController,
    this.onchanged,
    this.onclick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < labels!.length; i++)
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            child: CustomerTextField(
              secure: i == 1 ? true : false,
              readonly: false,
              borderColor: Colors.white,
              color: Colors.white,
              lines: 1,
              onChanged: (value) => {},
              controller: controller![i],
              labelText: labels![i],
              error: validators![i]['message'].toString(),
              validate:
                  validators![i]['value'].toString().toLowerCase() == 'true'
                      ? true
                      : false,
            ),
          ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Transform.scale(
              scale: 1.35,
              child: Theme(
                child: Checkbox(
                  splashRadius: 0,
                  activeColor: Colors.white,
                  hoverColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  checkColor: Colors.black,
                  onChanged: (value) => onchanged!(value),
                  value: checkBoxController,
                ),
                data: ThemeData(
                  primarySwatch: Colors.blue,
                  unselectedWidgetColor: Colors.red, // Your color
                ),
              ),
            ),
            const TextComponent(
              title: "Remember me",
              fontSize: 16,
              weight: FontWeight.w600,
              textColor: Colors.white,
              align: TextAlign.left,
              line: 1,
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
