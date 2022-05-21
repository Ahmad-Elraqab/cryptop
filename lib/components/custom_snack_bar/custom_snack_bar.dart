import 'package:cryptop/components/text_component/text_component.dart';
import 'package:flutter/material.dart';

SnackBar snackBar(value) => SnackBar(
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.grey.withOpacity(0.8),
        ),
        height: 50.0,
        margin: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Center(
          child: TextComponent(
            fontSize: 16,
            align: TextAlign.center,
            line: 1,
            textColor: Colors.white,
            weight: FontWeight.bold,
            title: value!.toString(),
          ),
        ),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
    );

SnackBar login_snackbart(value) => SnackBar(
      content: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.8),
          ),
          height: 200.0,
          width: 200.0,
          margin: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Center(
            child: TextComponent(
              fontSize: 16,
              align: TextAlign.center,
              line: 1,
              textColor: Color.fromARGB(255, 0, 0, 0),
              weight: FontWeight.bold,
              title: value!.toString(),
            ),
          ),
        ),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
    );
