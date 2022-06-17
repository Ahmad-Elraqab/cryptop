import 'package:cryptop/components/title_header/title_header.dart';
import 'package:flutter/material.dart';

class OpaqueImage extends StatelessWidget {
  final imageUrl;

  const OpaqueImage({Key? key, @required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Color.fromARGB(255, 55, 61, 76),
        ),
        const TitleHeader(isTitle: true, title: 'Profile'),
        Center(
          child: SizedBox(
            height: 200.0,
            width: 200.0,
            child: Image.asset(
              imageUrl,
              width: double.maxFinite,
              height: double.maxFinite,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
