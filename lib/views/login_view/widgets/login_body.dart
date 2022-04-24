import 'package:cryptop/views/login_view/widgets/login_button.dart';
import 'package:cryptop/views/login_view/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../components/loading/loading.dart';
import '../../../viewmodels/user_viewmodel/user_action.dart';

class LoginBody extends StatelessWidget {
  final List<String>? labels;
  final Function? onclick;
  final bool? loading;

  const LoginBody({
    Key? key,
    this.labels,
    this.onclick,
    this.loading,
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
          onclick: onclick,
        ),
        loading == true
            ? const LoadingView()
            : LoginButton(
                onclick: onclick,
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
              Navigator.pushReplacementNamed(context, '/signup')
            },
            child: Row(
              children: [
                Text("Don't have an account? ",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 16,
                    )),
                Text(
                  "Sign Up",
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
