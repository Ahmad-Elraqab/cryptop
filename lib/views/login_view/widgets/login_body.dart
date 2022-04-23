import 'package:cryptop/views/login_view/widgets/login_button.dart';
import 'package:cryptop/views/login_view/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../components/loading/loading.dart';

class LoginBody extends StatelessWidget {
  final List<String>? labels;
  final List<TextEditingController>? controller;
  final List<Map<String, Object>>? validators;
  final bool? checkBoxController;
  final Function? onTextChange;
  final Function? onchanged;
  final Function? onclick;
  final dynamic watch;

  const LoginBody({
    Key? key,
    this.labels,
    this.controller,
    this.validators,
    this.checkBoxController,
    this.onchanged,
    this.onclick,
    this.onTextChange,
    this.watch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Login into\nyour account',
            style: GoogleFonts.openSans(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        LoginForm(
          labels: labels,
          controller: controller,
          validators: validators,
          checkBoxController: checkBoxController,
          onchanged: onchanged,
          onclick: onclick,
        ),
        watch == true
            ? const LoadingView()
            : LoginButton(
                onclick: onclick,
                validators: validators,
                controller: controller,
                checkBoxController: checkBoxController,
              ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _buildLogin(context),
        ),
      ],
    );
  }

  _buildLogin(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: InkWell(
            onTap: () => {Navigator.pushReplacementNamed(context, '/signup')},
            child: Row(
              children: [
                Text("Don't have an account? ",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 16,
                    )),
                Text("Sign Up",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
