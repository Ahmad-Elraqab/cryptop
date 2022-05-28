import 'package:cryptop/components/custom_buttom/custom_button.dart';
import 'package:cryptop/components/custom_snack_bar/custom_snack_bar.dart';
import 'package:cryptop/components/loading_animation/loading_animation.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/models/smart_trade_model.dart';
import 'package:cryptop/viewmodels/smart_trade_viewmodel/smart_trade_action.dart';
import 'package:cryptop/views/smart_trade_view/widgets/smart_trade_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SmartTradeListItemBody extends StatefulWidget {
  const SmartTradeListItemBody({
    Key? key,
    this.activeIndex,
    this.setForm,
    this.controllers,
    this.smartTrade,
  }) : super(key: key);
  final int? activeIndex;
  final Function? setForm;
  final SmartTradeModel? smartTrade;
  final List<TextEditingController>? controllers;

  @override
  State<SmartTradeListItemBody> createState() => _SmartTradeListItemBodyState();
}

class _SmartTradeListItemBodyState extends State<SmartTradeListItemBody> {
  bool loading = false;

  ontoggle() async {
    loading = true;
    final data =
        await context.read(toggleSmartTrade(widget.smartTrade!.id!).future);

    if (data != null) {
      ScaffoldMessenger.of(context).showSnackBar(network_snackBar(0));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(network_snackBar(1));
    }
    loading = false;
    setState(() {});
  }

  onclose() async {
    loading = true;
    final data =
        await context.read(closeSmartTrade(widget.smartTrade!.id!).future);

    if (data != null) {
      ScaffoldMessenger.of(context).showSnackBar(network_snackBar(0));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(network_snackBar(1));
    }
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final data = [
      {'input': 'start date', 'value': widget.smartTrade!.startDate},
      {'input': 'end date', 'value': widget.smartTrade!.endDate},
      {'input': 'amount', 'value': '${widget.smartTrade!.amount}\$'},
      {'input': 'buy price', 'value': widget.smartTrade!.buyOn},
      {'input': 'sell price', 'value': widget.smartTrade!.sellOn},
      {'input': 'technique', 'value': widget.smartTrade!.type},
      {'input': 'trade count', 'value': widget.smartTrade!.numberOfTrades},
      {'input': 'rate', 'value': widget.smartTrade!.profit},
      {'input': 'stop lose', 'value': widget.smartTrade!.stopLose},
    ];
    final buttons = ['Active', 'Edit', 'Delete', 'View Details'];
    return loading == true
        ? LoadingAnimation()
        : Column(
            children: [
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                childAspectRatio: 3,
                mainAxisSpacing: 20.0,
                children: [
                  for (int i = 0; i < data.length; i++)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextComponent(
                          align: TextAlign.start,
                          fontSize: 9.0,
                          line: 1,
                          textColor: Colors.white,
                          title: data[i]['input'].toString(),
                          weight: FontWeight.bold,
                        ),
                        TextComponent(
                          align: TextAlign.start,
                          fontSize: 12.0,
                          line: 1,
                          textColor: Colors.white,
                          title: data[i]['value'].toString(),
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < buttons.length; i++)
                    CustomButtom(
                      borderColor: Colors.transparent,
                      borderRadius: 5.0,
                      buttonColor: i == 0 ? Colors.amber : Colors.grey,
                      buttonText: buttons[i],
                      buttonTextColor: Colors.white,
                      fontSize: 12,
                      hasImage: false,
                      height: 30.0,
                      horizontal: 16.0,
                      vertical: 4.0,
                      imageUrl: '',
                      onTap: () {
                        if (i == 0) {
                          ontoggle();
                        } else if (i == 2 &&
                            widget.smartTrade!.isClose == false) {
                          onclose();
                        } else if (i == 1) {
                          showBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context) => Container(
                              padding: const EdgeInsets.all(24.0),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15.0),
                                  topLeft: Radius.circular(15.0),
                                ),
                                color: Color.fromARGB(255, 39, 44, 56),
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.55,
                              child: SmartTradeBottomSheet(
                                smartTrade: widget.smartTrade,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                ],
              )
            ],
          );
  }
}
