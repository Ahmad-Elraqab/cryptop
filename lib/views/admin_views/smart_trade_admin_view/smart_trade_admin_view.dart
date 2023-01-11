import 'package:cryptop/components/custom_snack_bar/custom_snack_bar.dart';
import 'package:cryptop/components/custom_switch/custom_switch.dart';
import 'package:cryptop/components/loading_animation/loading_animation.dart';
import 'package:cryptop/components/title_header/title_header.dart';
import 'package:cryptop/viewmodels/smart_trade_viewmodel/smart_trade_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SmartTradeAdminView extends StatefulWidget {
  const SmartTradeAdminView({Key? key}) : super(key: key);

  @override
  State<SmartTradeAdminView> createState() => _SmartTradeAdminViewState();
}

class _SmartTradeAdminViewState extends State<SmartTradeAdminView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, watch, child) {
          final data = watch(getSmartTradeAdmin).data?.value;
          return Container(
            height: MediaQuery.of(context).size.height,
            color: const Color.fromRGBO(55, 61, 76, 1),
            child: data == null
                ? LoadingAnimation()
                : Column(
                    children: [
                      TitleHeader(isTitle: true, title: 'Smart Trade'),
                      SizedBox(height: 50),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) => Container(
                              margin: EdgeInsets.only(bottom: 8.0),
                              child: CustomSwitch(
                                title: data[index]['type'].toString(),
                                state: data[index]['status'] == 'true',
                                setState: (val) {
                                  final res = context.read(
                                      toggleSmartTradeAdmin({
                                    'id': data[index]['val'],
                                    'status': val
                                  }).future);
                                  // ignore: unnecessary_null_comparison
                                  if (res == null) {
                                    data[index]['status'] = val.toString();
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(network_snackBar(1));
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(network_snackBar(0));
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
