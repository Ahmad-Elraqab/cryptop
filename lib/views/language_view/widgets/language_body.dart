import 'package:cryptop/components/custom_selection/custom_selection.dart';
import 'package:cryptop/components/custom_top_bar/custom_top_bar.dart';
import 'package:flutter/material.dart';

class LanguageBody extends StatelessWidget {
  final Function? onClick;
  final int? index;

  LanguageBody({Key? key, this.onClick, this.index}) : super(key: key);

  final languages = [
    'English',
    'Arabic',
    'Malay',
    'France',
    'German',
    'Russian'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTopBar(),
        const SizedBox(
          height: 30.0,
        ),
        for (var i = 0; i < languages.length; i++)
          CustomSelection(
            isActive: index! == i ? true : false,
            title: languages[i],
            onClick: onClick,
            index: i,
          ),
      ],
    );
  }
}
