
import 'package:flutter/cupertino.dart';

abstract class Constants {
  static const String API_KEY = '3a5aae775c777981fa3557ea1f5e0973';
}

class ThemeBuilder {
  final Color primary;
  final Color secondary;
  final Color white = const Color(0xFFFFFFFF);
  final Color whiteShade = const Color(0xFFFFFFFF).withOpacity(0.5);
  final Color blackShade = const Color(0xFF000000).withOpacity(0.05);
  final String bg;
  final RadialGradient gradient;

  ThemeBuilder({
    required this.primary,
    required this.secondary,
    required this.bg,
    RadialGradient? gradient,
  }) : gradient = gradient ??
      RadialGradient(
        colors: [primary.withOpacity(0.7), primary.withOpacity(0.3)],
      );
}

class ColorTheme {
  static ThemeBuilder cloudyOne = ThemeBuilder(
      primary: const Color(0xFF91B4C6), secondary: const Color(0xFFCAD7DF), bg: 'cloudy1');

  static ThemeBuilder cloudyTwo = ThemeBuilder(
      primary: const Color(0xFF5A8BAB), secondary: const Color(0xFFAED5E4), bg: 'cloudy2');

  static ThemeBuilder cloudyThree = ThemeBuilder(
      primary: const Color(0xFF9090AC), secondary: const Color(0xFF484A82), bg: 'cloudy3');
  static ThemeBuilder cloudyFour = ThemeBuilder(
      primary: const Color(0xFF5A8BAB), secondary: const Color(0xFFAED5E4), bg: 'cloudy4');
  static ThemeBuilder sunnyOne = ThemeBuilder(
      primary: const Color(0xFFFAE2BD), secondary: const Color(0xFFEFAA82), bg: 'sunny1');
  static ThemeBuilder sunnyTwo = ThemeBuilder(
      primary: const Color(0xFF5A8BAB), secondary: const Color(0xFFAED5E4), bg: 'sunny2');
  static ThemeBuilder rainyOne = ThemeBuilder(
      primary: const Color(0xFF40666A), secondary: const Color(0xFFC9E8E0), bg: 'rainy1');
  static ThemeBuilder rainyTwo = ThemeBuilder(
      primary: const Color(0xFF615273), secondary: const Color(0xFFC2B8FF), bg: 'rainy2');
  static ThemeBuilder rainyThree = ThemeBuilder(
      primary: const Color(0xFF7FC3AE), secondary: const Color(0xFFC9E8E0), bg: 'rainy3');
  static ThemeBuilder snowyOne = ThemeBuilder(
      primary: const Color(0xFF99B8CC), secondary: const Color(0xFFE4F1F9), bg: 'snowy1');
  static ThemeBuilder snowyTwo = ThemeBuilder(
      primary: const Color(0xFFA7ACC4), secondary: const Color(0xFFE2E2E3), bg: 'snowy2');
}