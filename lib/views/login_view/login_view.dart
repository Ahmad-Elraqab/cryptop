import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/models/user_model.dart';
import 'package:cryptop/viewmodels/user_viewmodel/user_action.dart';
import 'package:cryptop/views/login_view/widgets/login_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      List.generate(2, (i) => TextEditingController());
  String? selected;

  onTextChange(index, value) => setState(
        () {
          _controller[index].text = value;
          _controller[index].selection = TextSelection(
            baseOffset: value.length,
            extentOffset: value.length,
          );
        },
      );
  onchanged(value) => setState(() => checkBoxController = value);
  onclick() async {
    final user = await context
        .read(userViewmodel)
        .login(_controller[0].text, _controller[1].text);
    if (user is User) {
      ScaffoldMessenger.of(context)
          .showSnackBar(_snackBar('Logged in sucessfully!'));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(_snackBar('Invalid email or password!'));
    }
  }

  onselected(value) => setState(() => {selected = value});
  _snackBar(value) => SnackBar(
        content: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.grey.withOpacity(0.3),
          ),
          height: 50.0,
          margin: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Center(
            child: TextComponent(
              fontSize: 16,
              align: TextAlign.center,
              line: 1,
              textColor: Colors.white,
              weight: FontWeight.bold,
              title: value.toString(),
            ),
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(55, 61, 76, 1),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
          child: Consumer(
            builder: (context, watch, child) {
              final loading = watch(userViewmodel).load;
              return LoginBody(
                watch: loading,
                labels: labels,
                onchanged: onchanged,
                onTextChange: onTextChange,
                onclick: onclick,
                controller: _controller,
                validators: validators,
                onselected: onselected,
                selected: selected,
                checkBoxController: checkBoxController,
              );
            },
          ),
        ),
      ),
    );
  }
}
