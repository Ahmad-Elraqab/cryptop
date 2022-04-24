import 'package:cryptop/components/custom_buttom/custom_button.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Function? onclick;

  const LoginButton({
    Key? key,
    this.onclick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomButtom(
          buttonText: 'Login',
          borderColor: Colors.white,
          fontSize: 14,
          borderRadius: 30,
          imageUrl: '',
          hasImage: false,
          buttonTextColor: Colors.white,
          buttonColor: const Color.fromRGBO(55, 61, 76, 1),
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
