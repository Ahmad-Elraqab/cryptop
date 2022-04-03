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
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                spreadRadius: -5.0,
                color: Color.fromARGB(255, 203, 203, 203),
                offset: Offset(0, 15),
                blurRadius: 8,
              )
            ],
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            children: [
              ListTile(
                // ignore: deprecated_member_use
                leading: const Icon(
                  // ignore: deprecated_member_use
                  FontAwesomeIcons.mapMarked,
                  color: Colors.grey,
                ),
                title: const Text(
                  'My Address',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                trailing: const Icon(
                  FontAwesomeIcons.angleRight,
                  size: 15,
                  color: Colors.grey,
                ),
                onTap: () {
                  Navigator.pushNamed(context, rAddress);
                },
              ),
              ListTile(
                // ignore: deprecated_member_use
                leading: const Icon(
                  // ignore: deprecated_member_use
                  FontAwesomeIcons.userCircle,
                  color: Colors.grey,
                ),
                title: const Text(
                  'Account',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                trailing: const Icon(
                  FontAwesomeIcons.angleRight,
                  size: 15,
                  color: Colors.grey,
                ),
                onTap: () {
                  Navigator.pushNamed(context, rAcountInformation);
                },
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                spreadRadius: -5.0,
                color: Color.fromARGB(255, 203, 203, 203),
                offset: Offset(0, 10),
                blurRadius: 8,
              )
            ],
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            children: [
              for (var i in list)
                ListTile(
                  leading: Icon(
                    i["icon"] as IconData,
                    color: Colors.grey,
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
            ],
          ),
        ),
      ],
    );
  }
}
