import 'package:cryptop/views/login_view/widgets/login_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var checkBoxController = false;

  final labels = [
    'Username Or Email',
    'Password',
  ];
  final validators = [
    {'value': false, 'message': ''},
    {'value': false, 'message': ''},
  ];

  final List<TextEditingController> _controller =
      List.generate(5, (i) => TextEditingController());
  String? selected;

  onchanged(value) => setState(() => checkBoxController = value);
  onclick() => setState(() => {});
  onselected(value) => setState(() => {selected = value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(36, 36, 43, 1),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
          child: LoginBody(
            labels: labels,
            onchanged: onchanged,
            onclick: onclick,
            controller: _controller,
            validators: validators,
            onselected: onselected,
            selected: selected,
            checkBoxController: checkBoxController,
          ),
        ),
      ),
    );
  }
}
