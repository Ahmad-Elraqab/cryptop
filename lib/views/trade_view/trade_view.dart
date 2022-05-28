import 'dart:math';
import 'package:cryptop/components/custom_snack_bar/custom_snack_bar.dart';
import 'package:cryptop/models/order_model.dart';
import 'package:cryptop/models/order_models/limit_order_model.dart';
import 'package:cryptop/models/order_models/oco_model.dart';
import 'package:cryptop/models/order_models/stop_limit_model.dart';
import 'package:cryptop/viewmodels/chart_viewmodel/chart_action.dart';
import 'package:cryptop/viewmodels/order_viewmodel/order_action.dart';
import 'package:cryptop/viewmodels/ticker_viewmodel/ticker_action.dart';
import 'package:cryptop/views/trade_view/widgets/trade_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TradeView extends StatefulWidget {
  const TradeView({Key? key, required this.data}) : super(key: key);

  final Object data;
  @override
  State<TradeView> createState() => _TradeViewState();
}

class _TradeViewState extends State<TradeView> {
  int activeIndexList = 0;
  int tradeType = 0;
  double slider = 0;
  bool loading = false;
  setLoad(value) => setState(() => loading = value);
  final List<TextEditingController> controllers =
      List.generate(5, (i) => TextEditingController());

  // test purpose...

  // TODO// ADD NEW PROVIDER FOR VIEWS TO HOLD ITS STATES

  final wallet = 50000;

  setIndexList(value) => setState(() => {activeIndexList = value, slider = 0});

  setSlider(value) => setState(() {
        slider = double.parse(value.toString());
        controllers[4].text = (value / 100 * wallet).toString();
        controllers[3].text = ((value / 100 * wallet) /
                context
                    .read(tickerViewmodel)
                    .tickers!
                    .where((e) => e.symbol == (widget.data as Map)['symbol'])
                    .first
                    .lastPrice)
            .toString();
      });

  setTradeType(value) => setState(() => {tradeType = value});

  updateField(TextEditingController controller, oper, price, {value, type}) {
    var string;
    var decimals;
    var value_1;
    var value_2;

    if (controller.text.isNotEmpty) {
      string = double.parse(controller.text).toString();
      decimals = string.substring(string.indexOf('.') + 1, string.length);
      value_1 = (double.parse(controller.text) + pow(10, -1 * decimals.length))
          .toStringAsFixed(decimals.length);
      value_2 = (double.parse(controller.text) - pow(10, -1 * decimals.length))
          .toStringAsFixed(decimals.length);
    }

    switch (oper) {
      case '+':
        add(controller, value_1, type);
        break;
      case '-':
        sub(controller, value_2, type);
        break;
      case '&':
        break;
      default:
    }
    updateCoin(type, price);
  }

  updateCoin(type, price) {
    if (controllers[type].text.isNotEmpty) {
      if (type == 3) {
        controllers[4].text =
            (price * double.parse(controllers[3].text)).toString();
      } else if (type == 4) {
        controllers[3].text =
            (double.parse(controllers[type].text) / price).toString();
      }
    }
  }

  add(TextEditingController controller, value, type) {
    if (controller.text.isNotEmpty) {
      controller.text = value.toString();
    } else {
      controller.text = (1.0).toString();
    }
  }

  sub(TextEditingController controller, value, type) {
    if (controller.text.isNotEmpty && double.parse(value) > 0) {
      controller.text = value.toString();
    } else {
      controller.text = (1.0).toString();
    }
  }

  onSubmit() async {
    bool _validate = validate();
    Map<String, dynamic> data = {};
    final price = context
        .read(tickerViewmodel)
        .tickers!
        .where((e) => e.symbol == (widget.data as Map)['symbol'])
        .first
        .lastPrice;
    if (_validate == true) {
      setLoad(true);

      switch (activeIndexList) {
        case 0:
          data = new LimitOrder(
                  type: 'limit',
                  amount: double.parse(controllers[4].text),
                  symbol: (widget.data as Map)['symbol'],
                  buyPrice: price,
                  limit: double.parse(controllers[0].text))
              .toJson();
          break;
        case 1:
          data = new Order(
                  type: 'market',
                  amount: double.parse(controllers[4].text),
                  symbol: (widget.data as Map)['symbol'],
                  buyPrice: price)
              .toJson();
          break;
        case 2:
          data = new StopLimitOrder(
                  type: 'stopLimit',
                  amount: double.parse(controllers[4].text),
                  symbol: (widget.data as Map)['symbol'],
                  buyPrice: price,
                  limit: double.parse(controllers[0].text),
                  stop: double.parse(controllers[1].text))
              .toJson();
          break;
        case 3:
          data = new OCOOrder(
                  type: 'oco',
                  amount: double.parse(controllers[4].text),
                  symbol: (widget.data as Map)['symbol'],
                  buyPrice: price,
                  limit: double.parse(controllers[0].text),
                  stop: double.parse(controllers[1].text),
                  s_limit: double.parse(controllers[2].text))
              .toJson();
          break;
        default:
      }
      final order = await context.read(orderViewmodel).createOrder(data);

      if (order != null) {
        setLoad(false);
        ScaffoldMessenger.of(context).showSnackBar(network_snackBar(0));
      }
    }
  }

  bool validate() {
    switch (activeIndexList) {
      case 0:
        if (controllers[0].text.isEmpty) {
          ScaffoldMessenger.of(context)
              .showSnackBar(snackBar('fill in required fields'));
          return false;
        }
        break;
      case 2:
        if (controllers[0].text.isEmpty || controllers[1].text.isEmpty) {
          ScaffoldMessenger.of(context)
              .showSnackBar(snackBar('fill in required fields'));
          return false;
        }
        break;
      case 3:
        if (controllers[0].text.isEmpty ||
            controllers[1].text.isEmpty ||
            controllers[2].text.isEmpty) {
          ScaffoldMessenger.of(context)
              .showSnackBar(snackBar('fill in required fields'));
          return false;
        }
        break;
      default:
    }
    if (controllers[3].text.isEmpty || controllers[4].text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(snackBar('fill in required fields'));
      return false;
    }

    return true;
  }

  @override
  void dispose() {
    controllers.map((e) => e.text = '');
    slider = 0.0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, watch, child) {
          watch(klineProvider)
              .whenData((value) => watch(chartViewmodel).updateCandle(value));
          watch(messageProvider)
              .whenData((value) => watch(tickerViewmodel).updateTickers(value));

          final chart = watch(chartViewmodel).liveChart;
          final tickers = watch(tickerViewmodel).tickers;

          return Container(
            height: MediaQuery.of(context).size.height,
            color: const Color.fromRGBO(55, 61, 76, 1),
            child: SingleChildScrollView(
              child: TradeBody(
                loading: loading,
                activeIndexList: activeIndexList,
                chart: chart,
                symbol: (widget.data as Map)['symbol'],
                tickers: tickers,
                slider: slider,
                tradeType: tradeType,
                controllers: controllers,
                setIndexList: setIndexList,
                setSlider: setSlider,
                setTradeType: setTradeType,
                onSubmit: onSubmit,
                updateField: updateField,
              ),
            ),
          );
        },
      ),
    );
  }
}
