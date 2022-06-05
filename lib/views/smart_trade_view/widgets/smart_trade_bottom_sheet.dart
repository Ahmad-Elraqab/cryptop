import 'package:cryptop/app/const.dart';
import 'package:cryptop/components/custom_buttom/custom_button.dart';
import 'package:cryptop/components/custom_text_field/custom_text_field.dart';
import 'package:cryptop/components/loading_animation/loading_animation.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/models/smart_trade_model.dart';
import 'package:cryptop/viewmodels/smart_trade_viewmodel/smart_trade_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../components/custom_snack_bar/custom_snack_bar.dart';

class SmartTradeBottomSheet extends StatefulWidget {
  const SmartTradeBottomSheet({Key? key, this.smartTrade}) : super(key: key);

  final SmartTradeModel? smartTrade;

  @override
  State<SmartTradeBottomSheet> createState() => _SmartTradeBottomSheetState();
}

class _SmartTradeBottomSheetState extends State<SmartTradeBottomSheet> {
  final List<TextEditingController> controllers =
      List.generate(11, (i) => TextEditingController());

  setForm(value, id) {
    switch (id) {
      case 1:
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
        controllers[id].text = value.toString();
        setState(() {});
    }
    setState(() {});
  }

  @override
  void initState() {
    if (widget.smartTrade != null) {
      // setForm(widget.smartTrade!.symbols, 0);
      for (var i in widget.smartTrade!.symbols!)
        controllers[0].text += (i + ',').toString();

      setForm(widget.smartTrade!.type, 1);
      setForm(widget.smartTrade!.interval, 2);
      setForm(widget.smartTrade!.buyOn, 3);
      setForm(widget.smartTrade!.sellOn, 4);
      setForm(widget.smartTrade!.sellRate, 5);
      setForm(widget.smartTrade!.amount, 6);
      setForm(widget.smartTrade!.numberOfSimultaneousTrades, 7);
      setForm(widget.smartTrade!.numberOfTrades, 8);
    }
    super.initState();
  }

  Future<void> onSubmit() async {
    var val = setForm(-1, 99);

    if (val == false) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar('Fill All Fields!'));
    } else {
      loading = true;
      Map<String, dynamic> form = {};
      controllers
          .forEach((e) => {form[textField[controllers.indexOf(e)]] = e.text});

      final ls = form['symbols'].split(',');
      ls.removeLast();

      final data;
      widget.smartTrade != null
          ? {
              form['id'] = widget.smartTrade!.id,
              data = await context.read(updateSmartTrade(form).future)
            }
          : data = await context.read(createSmartTrade(form).future);

      if (data != null) {
        loading = false;
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(network_snackBar(0));
        setForm(0, -1);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(network_snackBar(1));
      }
      setState(() {});
    }
  }

  final textField = [
    "title",
    "symbols",
    "type",
    "interval",
    "buy on",
    "sell on",
    "stop lose",
    "sell rate",
    "amount",
    "simulated trades",
    "trade count",
  ];

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading == true
        ? LoadingAnimation()
        : Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 30.0,
                childAspectRatio: 3,
                mainAxisSpacing: 10.0,
                children: [
                  for (int i = 0; i < textField.length; i++)
                    GestureDetector(
                      onDoubleTap: () {
                        if (i == 1) {
                          newMethod(context, i, exchange_pairs);
                        } else if (i == 2) {
                          newMethod(context, i, [
                            'RSI',
                            'ZSCORE',
                            'VWAP',
                            'WHALE SPLASH',
                            'PUMP CATCHER',
                            'R & S',
                            'TREND'
                          ]);
                        } else if (i == 3) {
                          newMethod(context, i, [
                            '1d',
                            '12h',
                            '8h',
                            '4h',
                            '2h',
                            '1h',
                            '30m',
                            '15m',
                            '5m',
                            '1m'
                          ]);
                        }
                      },
                      child: CustomerTextField(
                        borderColor: Colors.white,
                        color: Colors.white,
                        controller: controllers[i],
                        error: '',
                        labelText: textField[i],
                        lines: 1,
                        onChanged: (value) => {},
                        readonly: i == 1 || i == 2 || i == 3 ? true : false,
                        secure: false,
                        validate: false,
                        keyboardType:
                            i == 0 ? TextInputType.text : TextInputType.number,
                      ),
                    ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Consumer(
                    builder: (context, watch, child) => CustomButtom(
                      borderColor: Colors.transparent,
                      borderRadius: 5.0,
                      buttonColor: Colors.amber,
                      buttonText: widget.smartTrade != null ? 'Save' : 'Create',
                      buttonTextColor: Colors.white,
                      fontSize: 12,
                      hasImage: false,
                      height: 30.0,
                      horizontal: 10.0,
                      vertical: 4.0,
                      imageUrl: '',
                      onTap: onSubmit,
                    ),
                  ),
                  const SizedBox(width: 15.0),
                  CustomButtom(
                      borderColor: Colors.transparent,
                      borderRadius: 5.0,
                      buttonColor: Colors.grey,
                      buttonText: 'Discard',
                      buttonTextColor: Colors.white,
                      fontSize: 12,
                      hasImage: false,
                      height: 30.0,
                      horizontal: 10.0,
                      vertical: 4.0,
                      imageUrl: '',
                      onTap: () => {setForm(-1, -1), Navigator.pop(context)}),
                ],
              )
            ],
          );
  }

  Future<dynamic> newMethod(BuildContext context, int i, List data) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          backgroundColor: Colors.transparent,
          contentPadding: EdgeInsets.symmetric(horizontal: 45.0),
          content: Container(
            height: 300.0,
            width: 100.0,
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(
              child: ListView.builder(
                itemCount: data.length,
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                itemBuilder: (context, index) => InkWell(
                  onTap: () => {setForm(data[index], i), setState(() {})},
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextComponent(
                            align: TextAlign.center,
                            fontSize: 12,
                            line: 1,
                            textColor: Colors.grey,
                            title: data[index],
                            weight: FontWeight.w600,
                          ),
                          controllers[i].text.contains(data[index])
                              ? Icon(
                                  Icons.check,
                                  color: Colors.black87,
                                  size: 12,
                                )
                              : SizedBox()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
