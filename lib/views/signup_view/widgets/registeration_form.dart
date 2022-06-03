import 'package:cryptop/components/custom_text_field/custom_text_field.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/viewmodels/user_viewmodel/user_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterationForm extends StatelessWidget {
  final List<String>? labels;
  final Function? onclick;

  const RegisterationForm({
    Key? key,
    this.labels,
    this.onclick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controllers = context.read(userViewmodel).controllers;
    final validators = context.read(userViewmodel).validators;
    return Column(
      children: [
        for (var i = 0, j = 2; i < labels!.length; i++, j++)
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            child: CustomerTextField(
              secure: i == 3 || i == 4 ? true : false,
              borderColor: Colors.white,
              readonly: false,
              color: Colors.white,
              lines: 1,
              onChanged: (value) => {},
              controller: controllers[j],
              labelText: labels![i],
              error: context
                  .read(userViewmodel)
                  .validators[j]['message']
                  .toString(),
              validate: validators[j]['value'] as bool,
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
                  onChanged: (value) =>
                      context.read(userViewmodel).setCheckbox(value),
                  value: context.read(userViewmodel).checkbox,
                ),
                data: ThemeData(
                  primarySwatch: Colors.blue,
                  unselectedWidgetColor: Colors.red, // Your color
                ),
              ),
            ),
            const TextComponent(
              title: "Terms & Conditions",
              fontSize: 16,
              weight: FontWeight.w600,
              textColor: Colors.white,
              align: TextAlign.left,
              line: 1,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
