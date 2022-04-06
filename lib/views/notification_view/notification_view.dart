import 'package:cryptop/views/notification_view/widgets/notification_body.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  bool _switch = false;
  setSwitch(value) => setState(() => {_switch = value});
  bool _switch2 = false;
  setSwitch2(value) => setState(() => {_switch2 = value});
  bool _switch3 = false;
  setSwitch3(value) => setState(() => {_switch3 = value});
  bool _switch4 = false;
  setSwitch4(value) => setState(() => {_switch4 = value});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromRGBO(55, 61, 76, 1),
          height: MediaQuery.of(context).size.height,
          child: NotificationBody(
            stateSwitch: setSwitch,
            stateSwitch2: setSwitch2,
            stateSwitch3: setSwitch3,
            stateSwitch4: setSwitch4,
          ),
        ),
      ),
    );
  }
}
