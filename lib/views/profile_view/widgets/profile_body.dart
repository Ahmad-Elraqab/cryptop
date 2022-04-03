import 'package:cryptop/views/profile_view/widgets/profile_option_list.dart';
import 'package:cryptop/views/profile_view/widgets/profile_top_action.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ProfileTopAction(),
        ProfileOptionList(),
      ],
    );
  }
}
