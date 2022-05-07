import 'package:cryptop/views/profile_view/widgets/profile_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  final double height = 350;

  const ProfileView({Key? key}) : super(key: key);
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProfileBody(),
    );
  }
}
