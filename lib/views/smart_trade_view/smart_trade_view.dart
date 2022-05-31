import 'package:cryptop/viewmodels/smart_trade_viewmodel/smart_trade_action.dart';
import 'package:cryptop/views/smart_trade_view/widgets/smart_trade_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SmartTradeView extends StatefulWidget {
  const SmartTradeView({Key? key}) : super(key: key);

  @override
  State<SmartTradeView> createState() => _SmartTradeViewState();
}

class _SmartTradeViewState extends State<SmartTradeView> {
  int? activeIndex = 0;
  setIndex(value) => setState(() => {activeIndex = value});

  final List<TextEditingController> controllers =
      List.generate(9, (i) => TextEditingController());

  setForm(value, id) {
    switch (id) {
      case 0:
        if (controllers[id].text.contains(value)) {
          controllers[id].text =
              controllers[id].text.replaceAll((value + ','), '');
        } else {
          controllers[id].text += (value + ',');
        }
        break;
      case -1:
        for (var i in controllers) i.text = '';
        break;
      case 99:
        if (controllers.any((e) => e.text.isEmpty))
          return false;
        else
          return true;
      default:
        controllers[id].text = value;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          color: const Color.fromRGBO(55, 61, 76, 1),
          child: Consumer(
            builder: (context, watch, child) {
              final data = watch(getSmartTrade).data?.value;
              return SmartTradeBody(
                controllers: controllers,
                activeIndex: activeIndex,
                setIndex: setIndex,
                setForm: setForm,
                smartTradeList: data,
              );
            },
          ),
        ),
      ),
    );
  }
}
