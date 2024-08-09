import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF1A1A1A);
  static const Color grey = Color(0xFFD9D9D9);
  static const Color red = Color(0xFF870900);

  //Shadows
  static BoxShadow containerShadow = BoxShadow(
    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
    blurRadius: 4.0,
    offset: const Offset(4.0, 4.0),
  );

  static BoxShadow appBarShadow = BoxShadow(
    color: const Color.fromARGB(255, 158, 158, 158).withOpacity(0.5),
    blurRadius: 4.0,
    offset: const Offset(1.0, 4.0),
  );
}
