import 'package:cryptop/viewmodels/alert_viewmodel/alert_action.dart';
import 'package:cryptop/views/alert_view/widgets/alert_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlertView extends StatefulWidget {
  const AlertView({Key? key}) : super(key: key);

  @override
  State<AlertView> createState() => _AlertViewState();
}

class _AlertViewState extends State<AlertView> {
  int? activeIndex;
  setIndex(value) => setState(() => {activeIndex = value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          color: const Color.fromRGBO(55, 61, 76, 1),
          child: Consumer(builder: (context, watch, child) {
            final data = watch(getAlerts).data?.value;
            return AlertBody(
              activeIndex: activeIndex,
              setIndex: setIndex,
              alerts: data,
            );
          }),
        ),
      ),
    );
  }
}
