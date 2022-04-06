import 'package:cryptop/views/account_passwrod_view/widgets/account_password_body.dart';
import 'package:flutter/material.dart';

class AccountPasswordView extends StatefulWidget {
  const AccountPasswordView({Key? key}) : super(key: key);

  @override
  State<AccountPasswordView> createState() => _AccountPasswordViewState();
}

class _AccountPasswordViewState extends State<AccountPasswordView> {
  bool editable = false;
  bool secure = true;

  onSecure(value) => setState(() => secure = value);
  onClick(value) => setState(() => editable = value);
  onChange(value, controller) => setState(() => controller.text = value);
  final List<TextEditingController> controller = List.generate(
    3,
    (i) {
      var values = [
        '**********45',
        '',
        '',
      ];
      return TextEditingController(text: values[i]);
    },
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          height: MediaQuery.of(context).size.height,
          color: const Color.fromRGBO(55, 61, 76, 1),
          child: AccountPasswordBody(
            onSecure: onSecure,
            onClick: onClick,
            editable: editable,
            secure: secure,
            onChange: onChange,
            controllers: controller,
          ),
        ),
      ),
    );
  }
}
