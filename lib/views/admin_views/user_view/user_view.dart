import 'package:cryptop/components/custom_snack_bar/custom_snack_bar.dart';
import 'package:cryptop/viewmodels/user_viewmodel/user_action.dart';
import 'package:cryptop/views/admin_views/user_view/widgets/opaque_image.dart';
import 'package:cryptop/views/admin_views/user_view/widgets/profile_info_big_card.dart';
import 'package:cryptop/views/admin_views/user_view/widgets/profile_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/user_model.dart';

class UserView extends StatefulWidget {
  const UserView({Key? key, required this.data}) : super(key: key);

  final Object data;

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  onToggle() async {
    final isToggle =
        await context.read(toggleUser((widget.data as Map)['user']).future);

    if (isToggle is User) {
      ScaffoldMessenger.of(context).showSnackBar(network_snackBar(0));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(network_snackBar(1));
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color blueColor = Colors.amber;
    final screenHeight = MediaQuery.of(context).size.height;
    final User user = (widget.data as Map)['user'];
    final _data = [
      {'title': 'Name', 'value': user.name.toString()},
      {'title': 'Email', 'value': user.email.toString()},
      {'title': 'Gender', 'value': user.gender.toString()},
      {'title': 'Phone number', 'value': user.phoneNumber.toString()},
      {'title': 'Type', 'value': user.type.toString()},
      {'title': 'Username', 'value': user.username.toString()},
      {'title': 'Alerts', 'value': user.alerts!.length.toString()},
      {'title': 'SmartTrades', 'value': user.smartTrades!.length.toString()},
      {'title': 'Backtests', 'value': user.backtests!.length.toString()},
      {'title': 'Orders', 'value': user.orders!.length.toString()},
    ];
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Stack(
                  children: <Widget>[
                    OpaqueImage(
                      imageUrl: "lib/assets/logo.png",
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  padding: const EdgeInsets.only(top: 50),
                  color: Colors.white,
                  child: GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    childAspectRatio: 2,
                    children: [
                      for (var i = 0; i < _data.length; i++)
                        ProfileInfoBigCard(
                          firstText: _data[i]['value'].toString(),
                          secondText: _data[i]['title'].toString(),
                          icon: Icon(
                            Icons.abc,
                            size: 16,
                            color: blueColor,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: screenHeight * (4 / 9) - 50 / 2,
            left: 16,
            right: 16,
            child: Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  ProfileInfoCard(firstText: "Toggle", onTap: onToggle),
                  ProfileInfoCard(firstText: "Close", onTap: () => {}),
                  ProfileInfoCard(firstText: "Edit", onTap: () => {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
