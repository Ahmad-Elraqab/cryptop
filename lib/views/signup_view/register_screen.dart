import 'package:cryptop/views/signup_view/widgets/registeration_body.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var checkBoxController = false;

  final labels = [
    'First Name',
    'Last Name',
    'Email',
    'Password',
    'Repeat Password'
  ];
  final validators = [
    {'value': false, 'message': ''},
    {'value': false, 'message': ''},
    {'value': false, 'message': ''},
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
      backgroundColor: const Color.fromRGBO(55, 61, 76, 1),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
          child: RegisterationBody(
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
