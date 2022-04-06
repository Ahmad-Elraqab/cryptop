import 'package:cryptop/components/custom_buttom/custom_button.dart';
import 'package:flutter/material.dart';

class RegisterationButton extends StatelessWidget {
  final List<String>? labels;
  final List<TextEditingController>? controller;
  final List<Map<String, Object>>? validators;
  final bool? checkBoxController;
  final Function? onclick;
  final String? selected;

  const RegisterationButton(
      {Key? key,
      this.labels,
      this.controller,
      this.validators,
      this.checkBoxController,
      this.onclick,
      this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomButtom(
          buttonText: 'Signup',
          imageUrl: 'https://pngimg.com/uploads/google/google_PNG19635.png',
          hasImage: true,
          buttonTextColor: Colors.white,
          buttonColor: const Color.fromRGBO(55, 61, 76, 1),
          onTap: onclick,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomButtom(
          buttonText: 'Signup with Google',
          imageUrl: "https://pngimg.com/uploads/google/google_PNG19635.png",
          hasImage: true,
          buttonTextColor: Colors.black,
          buttonColor: Colors.white,
          onTap: onclick,
        ),
      ],
    );
  }
}
