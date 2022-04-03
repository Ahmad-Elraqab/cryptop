import 'package:flutter/material.dart';
import '../../../components/custom_text_field/custom_text_field.dart';

class AccountInformationForm extends StatelessWidget {
  const AccountInformationForm(
      {Key? key, this.editable, this.onChange, this.controllers})
      : super(key: key);

  final List<TextEditingController>? controllers;
  final Function? onChange;
  final bool? editable;
  @override
  Widget build(BuildContext context) {
    const labels = [
      'First Name',
      'Last Name',
      'Username',
      'Gender',
      'Phone Number',
      'Email'
    ];
    const validators = [
      {'value': false, 'message': ''},
      {'value': false, 'message': ''},
      {'value': false, 'message': ''},
      {'value': false, 'message': ''},
      {'value': false, 'message': ''},
      {'value': false, 'message': ''},
    ];

    return Column(
      children: [
        for (var i = 0; i < labels.length; i++)
          Container(
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: CustomerTextField(
              borderColor: Colors.white,
              readonly: editable!,
              color: Colors.white,
              lines: 1,
              onChanged: onChange,
              controller: controllers![i],
              labelText: labels[i],
              error: validators[i]['message'].toString(),
              validate:
                  validators[i]['value'].toString().toLowerCase() == 'true'
                      ? true
                      : false,
            ),
          ),
      ],
    );
  }
}
