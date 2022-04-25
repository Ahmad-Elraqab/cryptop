import 'package:cryptop/components/loading/loading.dart';
import 'package:cryptop/viewmodels/user_viewmodel/user_action.dart';
import 'package:cryptop/views/signup_view/widgets/registeration_button.dart';
import 'package:cryptop/views/signup_view/widgets/registeration_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterationBody extends StatelessWidget {
  final List<String>? labels;
  final Function? onclick;
  final bool? loading;

  const RegisterationBody({
    Key? key,
    this.labels,
    this.onclick,
    this.loading,
  }) : super(key: key);

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
        const SizedBox(height: 30.0),
        RegisterationForm(
          labels: labels,
          onclick: onclick,
        ),
        loading == true
            ? const LoadingView()
            : RegisterationButton(
                onclick: onclick,
              ),
        const SizedBox(
          height: 20.0,
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
            onTap: () => {
              context.read(userViewmodel).resetForm(),
              Navigator.pushReplacementNamed(context, '/login')
            },
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
