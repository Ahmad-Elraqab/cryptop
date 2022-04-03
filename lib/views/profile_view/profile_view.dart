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
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: widget.height,
              decoration: const BoxDecoration(
                color: Color(0xFF24242B),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40.0),
                  bottomLeft: Radius.circular(40.0),
                ),
              ),
            ),
            const ProfileBody()
          ],
        ),
      ),
    );
  }
}
