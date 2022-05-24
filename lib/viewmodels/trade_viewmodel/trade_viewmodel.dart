import 'package:flutter/material.dart';

class TradeViewmodel extends ChangeNotifier {
  final wallet = 50000;
  final List<TextEditingController> controllers =
      List.generate(5, (i) => TextEditingController());

  bool validateTrade(type) {
    switch (type) {
      case 'limit':
        break;
      case 'stopLimit':
        break;
      case 'market':
        break;
      case 'OCO':
        break;
      default:
    }

    return false;
  }

  updateField(type, oper, price) {
    if (oper == '+') {
      if (controllers[type].text.isEmpty) {
        controllers[type].text = 1.toString();
      } else {
        controllers[type].text =
            (double.parse(controllers[type].text) + 1).toString();
      }
    } else if (oper == '-' &&
        controllers[type].text.isNotEmpty &&
        double.parse(controllers[type].text) > 0) {
      controllers[type].text =
          (double.parse(controllers[type].text) - 1).toString();
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

  updateSlider(value) {}
  // Future<Trade>addTrade(){

  // }

  // Future<Trade>closeTrade(){

  // }

  // Future<Trade>getTrade(){

  // }

}
