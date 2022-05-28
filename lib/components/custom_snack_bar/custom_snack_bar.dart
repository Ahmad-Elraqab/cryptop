import 'package:cryptop/components/text_component/text_component.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

SnackBar snackBar(value) => SnackBar(
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Color.fromARGB(255, 244, 244, 244),
        ),
        height: 50.0,
        child: Center(
          child: TextComponent(
            fontSize: 14,
            align: TextAlign.center,
            line: 1,
            textColor: Colors.black87,
            weight: FontWeight.bold,
            title: value!.toString(),
          ),
        ),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
    );
SnackBar network_snackBar(int? value) => SnackBar(
      content: SizedBox(
        height: 200.0,
        child: Center(
          child: SizedBox(
              height: 70.0,
              child: RiveAnimation.asset(
                  'lib/assets/' + (value == 0 ? 'check' : 'fail') + '.riv')),
        ),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
    );
