import 'package:flutter/material.dart';

class Palette {
  static Color skyBlue = const Color(0xFF427FF0);
  static Color lightSkyBlue = const Color(0xFF74A0E9);
  static Color softGrey = const Color(0xFFF9F9F9);
  static Color goldYellow = const Color(0xFFDDB362);
  static Color black = const Color(0xFF282828);
  static Color white = const Color(0xFFFFFFFF);
  static Color checklistGreen = const Color(0xFF97CD58);
  static Color hardGray = const Color(0xFF424953);
  static Color blue = const Color(0xFF416ED1);
  static Color purpleBlue = const Color(0xFF5533e3);
  static Color gray = const Color(0xFFdedede);
  static Color purplishBlue = const Color(0xFF6948f0);
  static Color cloudyBlue = const Color(0xFFb8c1d2);
  static Color dark = const Color(0xFF1e1e23);
  static Color blueViolet = const Color(0xFF6200ee);
  static Color steel = const Color(0xFF7c8696);
  static Color brick = const Color(0xFFc7382a);
  static Color liliac = const Color(0xFFbb86fc);
  static Color darkGrey = const Color(0xFF1e1e22);
  static Color veryLightBlue = const Color(0xFFe4eaf3);
  static Color periwinkle = const Color(0xFF8e73ff);
  static Color paleGreyTwo = const Color(0xFFf2eeff);
  static Color orangeRed = const Color(0xFFff3226);

  static Map<int, Color> colorCodes = {
    50: const Color.fromRGBO(147, 205, 72, .1),
    100: const Color.fromRGBO(147, 205, 72, .2),
    200: const Color.fromRGBO(147, 205, 72, .3),
    300: const Color.fromRGBO(147, 205, 72, .4),
    400: const Color.fromRGBO(147, 205, 72, .5),
    500: const Color.fromRGBO(147, 205, 72, .6),
    600: const Color.fromRGBO(147, 205, 72, .7),
    700: const Color.fromRGBO(147, 205, 72, .8),
    800: const Color.fromRGBO(147, 205, 72, .9),
    900: const Color.fromRGBO(147, 205, 72, 1),
  };

  static MaterialColor materialBlue = MaterialColor(0xFF416ED1, colorCodes);
  static MaterialColor materialWhite = MaterialColor(0xFFFFFFFF, colorCodes);
}
