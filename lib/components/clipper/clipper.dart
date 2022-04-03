import 'package:flutter/material.dart';

class MyClipperSell extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width - 20, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 20);

    path.lineTo(size.width, size.height - 20);
    path.quadraticBezierTo(
        size.width, size.height, size.width - 20, size.height);

    path.lineTo(size.width * 0.6, size.height);
    path.lineTo(size.width * 0.4, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

class MyClipperBuy extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width * 0.4, 0);
    path.lineTo(20, 0);
    path.quadraticBezierTo(0, 0, 0, 20);
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(0, size.height, 20, size.height);
    path.lineTo(size.width * 0.6, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
