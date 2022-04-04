import 'package:cryptop/components/custom_buttom/custom_button.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final List<String>? labels;
  final List<TextEditingController>? controller;
  final List<Map<String, Object>>? validators;
  final bool? checkBoxController;
  final Function? onclick;
  final String? selected;

  const LoginButton(
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
          buttonText: 'Login',
          imageUrl: null,
          hasImage: false,
          buttonTextColor: Colors.white,
          buttonColor: const Color.fromRGBO(36, 36, 43, 1),
          onTap: onclick,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomButtom(
          buttonText: 'Login with Google',
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