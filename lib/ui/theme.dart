import 'package:flutter/material.dart';

class ColorPalette {
  static const Color primaryColor = Color(0xff003049);
  static const Color onPrimaryColor = Color(0xffffffff);
  static const Color primaryTextColor = Color(0xff212121);
  static const Color secondaryColor = Color(0xff619b8a);
  static const Color secondaryTextColor = Color(0xff757575);
  static const Color surface = Color.fromARGB(255, 107, 107, 107);
}

const TextTheme textTheme = TextTheme(
  displayLarge: TextStyle(
    fontFamily: 'roboto',
    color: ColorPalette.primaryTextColor,
    fontWeight: FontWeight.w400,
    fontSize: 57,
    letterSpacing: -0.25,
  ),
  displayMedium: TextStyle(
    fontFamily: 'roboto',
    color: ColorPalette.primaryTextColor,
    fontWeight: FontWeight.w400,
    fontSize: 45,
  ),
  displaySmall: TextStyle(
    fontFamily: 'roboto',
    color: ColorPalette.primaryTextColor,
    fontWeight: FontWeight.w400,
    fontSize: 36,
  ),
  headlineLarge: TextStyle(
    fontFamily: 'roboto',
    color: ColorPalette.primaryTextColor,
    fontWeight: FontWeight.w400,
    fontSize: 32,
  ),
  headlineMedium: TextStyle(
    fontFamily: 'roboto',
    color: ColorPalette.primaryTextColor,
    fontWeight: FontWeight.w400,
    fontSize: 28,
  ),
  headlineSmall: TextStyle(
    fontFamily: 'roboto',
    color: ColorPalette.primaryTextColor,
    fontWeight: FontWeight.w400,
    fontSize: 24,
  ),
  titleLarge: TextStyle(
    fontFamily: 'roboto',
    color: ColorPalette.primaryTextColor,
    fontWeight: FontWeight.w700,
    fontSize: 22,
  ),
  titleMedium: TextStyle(
    fontFamily: 'roboto',
    color: ColorPalette.primaryTextColor,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    letterSpacing: 0.1,
  ),
  titleSmall: TextStyle(
    fontFamily: 'roboto',
    color: ColorPalette.primaryTextColor,
    fontWeight: FontWeight.w600,
    fontSize: 14,
    letterSpacing: 0.1,
  ),
  labelLarge: TextStyle(
    fontFamily: 'roboto',
    color: ColorPalette.primaryTextColor,
    fontWeight: FontWeight.w700,
    fontSize: 14,
  ),
  labelMedium: TextStyle(
    fontFamily: 'roboto',
    color: ColorPalette.primaryTextColor,
    fontWeight: FontWeight.w700,
    fontSize: 10,
  ),
  labelSmall: TextStyle(
    fontFamily: 'roboto',
    color: ColorPalette.primaryTextColor,
    fontWeight: FontWeight.w700,
    fontSize: 11,
  ),
  bodyLarge: TextStyle(
    fontFamily: 'roboto',
    color: ColorPalette.primaryTextColor,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  ),
  bodyMedium: TextStyle(
    fontFamily: 'roboto',
    color: ColorPalette.primaryTextColor,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  ),
  bodySmall: TextStyle(
    fontFamily: 'roboto',
    color: ColorPalette.primaryTextColor,
    fontWeight: FontWeight.w400,
    fontSize: 12,
  ),
);
