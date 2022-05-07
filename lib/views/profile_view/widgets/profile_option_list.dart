import 'package:cryptop/app/const.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileOptionList extends StatelessWidget {
  const ProfileOptionList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = {
      {
        "value": "My Address",
        "icon": FontAwesomeIcons.mapMarked,
        'screen': rAddress
      },
      {
        "value": "Account",
        "icon": FontAwesomeIcons.userCircle,
        'screen': rAcountInformation
      },
      {
        "value": "Notification",
        "icon": FontAwesomeIcons.bell,
        'screen': rNotifications
      },
      {
        "value": "Privacy and security",
        "icon": FontAwesomeIcons.userLock,
        'screen': rNotifications
      },
      {
        "value": "Password",
        "icon": FontAwesomeIcons.key,
        'screen': rAcountPassword
      },
      {
        "value": "Language",
        "icon": FontAwesomeIcons.language,
        'screen': rLanguages
      },
      {
        "value": "Payment",
        "icon": FontAwesomeIcons.creditCard,
        'screen': rPayment
      },
      {
        "value": "Help and support",
        "icon": FontAwesomeIcons.headset,
        'screen': rNotifications
      },
      {
        "value": "About",
        // ignore: deprecated_member_use
        "icon": FontAwesomeIcons.questionCircle,
        'screen': rNotifications
      },
    };
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          for (var i in list)
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 2,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                ),
              ),
              child: ListTile(
                leading: Icon(
                  i["icon"] as IconData,
                  color: Colors.black45,
                ),
                title: Text(
                  i["value"].toString(),
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
                trailing: const Icon(
                  FontAwesomeIcons.angleRight,
                  size: 15,
                  color: Colors.grey,
                ),
                onTap: () {
                  Navigator.pushNamed(context, i['screen'].toString());
                },
              ),
            ),
        ],
      ),
    );
  }
}
