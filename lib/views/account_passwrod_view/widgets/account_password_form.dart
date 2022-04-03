import 'package:flutter/material.dart';
import '../../../components/custom_text_field/custom_text_field.dart';

class AccountPasswordForm extends StatelessWidget {
  const AccountPasswordForm(
      {Key? key, this.editable, this.onChange, this.controllers, this.secure})
      : super(key: key);

  final List<TextEditingController>? controllers;
  final Function? onChange;
  final bool? editable;
  final bool? secure;
  @override
  Widget build(BuildContext context) {
    const labels = ['Password', 'New Password', 'Repeat New Password'];
    const validators = [
      {'value': false, 'message': ''},
      {'value': false, 'message': ''},
      {'value': false, 'message': ''},
    ];

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: CustomerTextField(
            borderColor: Colors.white,
            readonly: true,
            color: Colors.white,
            lines: 1,
            onChanged: onChange,
            controller: controllers![0],
            labelText: labels[0],
            error: validators[0]['message'].toString(),
            validate: validators[0]['value'].toString().toLowerCase() == 'true'
                ? true
                : false,
          ),
        ),
        for (var i = 1; i < labels.length; i++)
          editable!
              ? Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: CustomerTextField(
                    borderColor: Colors.white,
                    readonly: false,
                    color: Colors.white,
                    lines: 1,
                    secure: secure,
                    onChanged: onChange,
                    controller: controllers![i],
                    labelText: labels[i],
                    error: validators[i]['message'].toString(),
                    validate: validators[i]['value'].toString().toLowerCase() ==
                            'true'
                        ? true
                        : false,
                  ),
                )
              : const SizedBox()
      ],
    );
  }
}
