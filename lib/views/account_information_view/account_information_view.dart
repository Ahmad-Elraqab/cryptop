import 'package:cryptop/viewmodels/user_viewmodel/user_action.dart';
import 'package:cryptop/views/account_information_view/widgets/account_information_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountInformationView extends StatefulWidget {
  const AccountInformationView({Key? key}) : super(key: key);

  @override
  State<AccountInformationView> createState() => _AccountInformationViewState();
}

class _AccountInformationViewState extends State<AccountInformationView> {
  bool editable = true;

  onClick(value) => setState(() => editable = value);
  onChange(value, controller) => setState(() => {controller.text = value});
  final List<TextEditingController> controller =
      List.generate(5, (index) => TextEditingController());

  @override
  void initState() {
    super.initState();
    final viewmodel = context.read(userViewmodel);
    viewmodel.readToken();
    controller[0].text = viewmodel.user!.name.toString();
    controller[1].text = viewmodel.user!.username.toString();
    controller[2].text = viewmodel.user!.gender.toString();
    controller[3].text = viewmodel.user!.email.toString();
    controller[4].text = viewmodel.user!.phoneNumber.toString();
  }

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
