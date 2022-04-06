import 'package:cryptop/views/account_information_view/widgets/account_information_body.dart';
import 'package:flutter/material.dart';

class AccountInformationView extends StatefulWidget {
  const AccountInformationView({Key? key}) : super(key: key);

  @override
  State<AccountInformationView> createState() => _AccountInformationViewState();
}

class _AccountInformationViewState extends State<AccountInformationView> {
  bool editable = true;

  onClick(value) => setState(() => editable = value);
  onChange(value, controller) => setState(() => {controller.text = value});
  final List<TextEditingController> controller = List.generate(
    6,
    (i) {
      var values = [
        'Ahmad',
        'Elraqab',
        'Amjrr99',
        'Male',
        '+966540017063',
        'amjrr99@gmail.com',
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
          child: AccountInformationBody(
            onClick: onClick,
            editable: editable,
            onChange: onChange,
            controllers: controller,
          ),
        ),
      ),
    );
  }
}
