import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileTopAction extends StatelessWidget {
  const ProfileTopAction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 60, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: const SizedBox(
                  width: 30.0,
                  height: 30.0,
                  child: Icon(
                    // ignore: deprecated_member_use
                    FontAwesomeIcons.edit,
                    color: Colors.white,
                  ),
                ),
                onTap: () => {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container();
                    },
                  )
                },
              ),
              InkWell(
                child: const SizedBox(
                  width: 30.0,
                  height: 30.0,
                  child: Icon(
                    FontAwesomeIcons.bell,
                    color: Colors.white,
                  ),
                ),
                onTap: () => {},
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(''),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(50, 15, 50, 30),
          child: const Text(
            "dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever.",
            style: TextStyle(
                color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
