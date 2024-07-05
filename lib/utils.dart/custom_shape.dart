import 'package:flutter/material.dart';

class Customshape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double maxHeight = size.height;
    double height = (maxHeight / 4) * 3;
    double width = size.width;
    int widthSlice = 15;
    int heightSlice = 3;
    int widthSliceOffset = 1;

    var controlP_1 = Offset(0, height);
    var endP_1 = Offset(width / widthSlice * widthSliceOffset, height);

    var controlP_2 = Offset(width, height);
    var endP_2 = Offset(width, maxHeight);

    var path = Path();
    path.lineTo(0, (height / heightSlice) * 2);

    path.quadraticBezierTo(controlP_1.dx, controlP_1.dy, endP_1.dx, endP_1.dy);

    path.lineTo(width - (width / widthSlice) * widthSliceOffset, height);

    path.quadraticBezierTo(controlP_2.dx, controlP_2.dy, endP_2.dx, endP_2.dy);

    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
