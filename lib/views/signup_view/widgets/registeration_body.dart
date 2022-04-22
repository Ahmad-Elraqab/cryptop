import 'package:cryptop/views/signup_view/widgets/registeration_button.dart';
import 'package:cryptop/views/signup_view/widgets/registeration_form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterationBody extends StatelessWidget {
  final List<String>? labels;
  final List<TextEditingController>? controller;
  final List<Map<String, Object>>? validators;
  final bool? checkBoxController;
  final Function? onchanged;
  final Function? onclick;
  final Function? onselected;
  final String? selected;

  const RegisterationBody(
      {Key? key,
      this.labels,
      this.controller,
      this.validators,
      this.checkBoxController,
      this.onchanged,
      this.onclick,
      this.onselected,
      this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Create\nyour account',
            style: GoogleFonts.openSans(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        RegisterationForm(
          labels: labels,
          controller: controller,
          validators: validators,
          checkBoxController: checkBoxController,
          onchanged: onchanged,
          onclick: onclick,
          selected: selected,
          onselected: onselected,
        ),
        RegisterationButton(
          onclick: onclick,
          validators: validators,
          controller: controller,
          checkBoxController: checkBoxController,
          selected: selected,
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
            onTap: () => {Navigator.pushReplacementNamed(context, '/login')},
            child: Row(
              children: [
                Text("Already have an account? ",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 16,
                    )),
                Text(
                  "Login",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
