import 'package:cryptop/views/language_view/widgets/language_body.dart';
import 'package:flutter/material.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({Key? key}) : super(key: key);

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  int index = 0;
  onClick(value) => setState((() => index = value));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          height: MediaQuery.of(context).size.height,
          color: const Color.fromRGBO(36, 36, 43, 1),
          child: LanguageBody(onClick: onClick, index: index),
        ),
      ),
    );
  }
}
