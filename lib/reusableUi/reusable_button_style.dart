import 'package:flutter/material.dart';
import 'package:ginFinans/util/palette.dart';

import 'base_style.dart';

abstract class ReusableButtonStyle {
  static var primaryButtonStyle = {
    'color': Palette.lightSkyBlue,
    'secondaryColor': Palette.blue,
    'size': Size(height: 50, width: double.infinity),
    'contAlignment': Alignment.center,
    'fontColor': Palette.white,
    'fontStyle': FontStyle.h2,
    'borderRadiusRectangle': 10,
    'gradient':
        OneGradient(begin: Alignment.centerLeft, end: Alignment.centerRight),
    'margin': Space(top: 10, bottom: 10, right: 15, left: 15),
  };
}
