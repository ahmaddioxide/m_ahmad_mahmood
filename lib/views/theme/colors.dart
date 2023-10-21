import 'package:flutter/material.dart';

class AppColors {
  AppColors._private();

  static final AppColors _instance = AppColors._private();

  factory AppColors() => _instance;

  Color get white => const Color(0xFFFFFFFF);

  Color get black => const Color(0xFF000000);

  Color get grey => const Color(0xFF666666);

  Color get tranquil => const Color(0xFFDBEBED);
}
