import 'package:cryptop/app/const.dart';
import 'package:cryptop/components/custom_buttom/custom_button.dart';
import 'package:cryptop/components/custom_snack_bar/custom_snack_bar.dart';
import 'package:cryptop/components/custom_text_field/custom_text_field.dart';
import 'package:cryptop/components/loading_animation/loading_animation.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/models/alert_model.dart';
import 'package:cryptop/viewmodels/alert_viewmodel/alert_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlertBottomSheet extends StatefulWidget {
  AlertBottomSheet({
    Key? key,
    this.alert,
  }) : super(key: key);

  final Alert? alert;
  @override
  State<AlertBottomSheet> createState() => _AlertBottomSheetState();
}

class _AlertBottomSheetState extends State<AlertBottomSheet> {
  final textField = [
    'symbol',
    'alert type',
    'alert value',
  ];

  void initState() {
    if (widget.alert != null) {
      _controller[0].text = widget.alert!.symbol.toString();
      _controller[1].text = widget.alert!.type.toString();
      _controller[2].text = widget.alert!.value.toString();
    }
    super.initState();
  }

  setForm(value, id) {
    switch (id) {
      case -1:
        for (var i in _controller) i.text = '';
        break;
      case 99:
        if (_controller[0].text.isNotEmpty &&
            (_controller[1].text.contains('vwap >') ||
                _controller[1].text.contains('vwap <'))) return true;
        if (_controller.any((e) => e.text.isEmpty))
          return false;
        else
          return true;
      default:
        _controller[id].text = value.toString();
        setState(() {});
    }
    setState(() {});
  }

  Future<void> onSubmit() async {
    var val = setForm(-1, 99);

    if (val == false) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar('Fill All Fields!'));
    } else {
      loading = true;
      Map<String, dynamic> form = Alert(
        symbol: _controller[0].text,
        type: _controller[1].text,
        value: double.parse(
            _controller[2].text.isEmpty ? "0" : _controller[2].text),
      ).toJson();

      final data;
      if (widget.alert == null) {
        data = await context.read(createAlerts(form).future);
      } else {
        form['id'] = widget.alert!.id;
        data = await context.read(updateAlert(form).future);
      }

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

  final List<TextEditingController> _controller =
      List.generate(3, (i) => TextEditingController());

  bool? loading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15.0),
          topLeft: Radius.circular(15.0),
        ),
        color: Color.fromARGB(255, 39, 44, 56),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.4,
      child: loading == true
          ? LoadingAnimation()
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GridView.count(
                  crossAxisCount: 1,
                  shrinkWrap: true,
                  childAspectRatio: 10,
                  mainAxisSpacing: 20.0,
                  children: [
                    for (int i = 0; i < textField.length; i++)
                      (_controller[1].text.contains('vwap >') ||
                                  _controller[1].text.contains('vwap <')) &&
                              i == 2
                          ? SizedBox()
                          : GestureDetector(
                              onDoubleTap: () {
                                if (i == 0) {
                                  newMethod(context, i, exchange_pairs);
                                } else if (i == 1) {
                                  newMethod(context, i, [
                                    'price >',
                                    'price <',
                                    'rsi >',
                                    'rsi <',
                                    'vwap >',
                                    'vwap <',
                                  ]);
                                }
                              },
                              child: CustomerTextField(
                                borderColor: Colors.white,
                                color: Colors.white,
                                controller: _controller[i],
                                error: '',
                                labelText: textField[i],
                                lines: 1,
                                onChanged: (value) => {},
                                readonly: i == 2 ? false : true,
                                secure: false,
                                validate: false,
                              ),
                            ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButtom(
                      borderColor: Colors.transparent,
                      borderRadius: 5.0,
                      buttonColor: Colors.amber,
                      buttonText: 'Create',
                      buttonTextColor: Colors.white,
                      fontSize: 12,
                      hasImage: false,
                      height: 30.0,
                      horizontal: 10.0,
                      vertical: 4.0,
                      imageUrl: '',
                      onTap: onSubmit,
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
                      onTap: () => setForm(-1, -1),
                    ),
                  ],
                )
              ],
            ),
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
                          _controller[i].text.contains(data[index])
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
