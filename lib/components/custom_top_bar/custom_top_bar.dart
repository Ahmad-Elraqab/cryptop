import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTopBar extends StatefulWidget {
  final double height = 120;
  final Color? background;
  final Color? buttonColor;
  const CustomTopBar({
    Key? key,
    this.background = Colors.white,
    this.buttonColor = const Color.fromRGBO(36, 36, 43, 1),
  }) : super(key: key);
  @override
  _CustomTopBarState createState() => _CustomTopBarState();
}

class _CustomTopBarState extends State<CustomTopBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(24.0),
          height: widget.height,
          decoration: BoxDecoration(
            color: widget.background!,
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(40.0),
                bottomLeft: Radius.circular(40.0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  // Navigator.pushNamedAndRemoveUntil(
                  //     context, "/landing", (Route<dynamic> route) => false);
                  // setState(() {});
                  Navigator.pop(context);
                },
                child: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: widget.background!,
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(
                      color: widget.buttonColor!,
                      width: 2.0,
                    ),
                  ),
                  child: Icon(
                    FontAwesomeIcons.angleLeft,
                    size: 16,
                    color: widget.buttonColor!,
                  ),
                ),
              ),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: widget.background!,
                  borderRadius: BorderRadius.circular(20.0),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80"),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
