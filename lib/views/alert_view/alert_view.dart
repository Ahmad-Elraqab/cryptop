import 'package:cryptop/views/alert_view/widgets/alert_body.dart';
import 'package:flutter/material.dart';

class AlertView extends StatefulWidget {
  const AlertView({Key? key}) : super(key: key);

  @override
  State<AlertView> createState() => _AlertViewState();
}

class _AlertViewState extends State<AlertView> {
  int? activeIndex;
  setIndex(value) => setState(() => {activeIndex = value});
  create() => {};
  edit() => {};
  delete() => {};
  status() => {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          color: const Color.fromRGBO(55, 61, 76, 1),
          child: AlertBody(
            activeIndex: activeIndex,
            create: create,
            delete: delete,
            edit: edit,
            setIndex: setIndex,
            status: status,
          ),
        ),
      ),
    );
  }
}
