import 'package:flutter/material.dart';

class FontFamilies {
  static const regular = 'MontserratRegular';
  static const bold = 'MontserratBold';
  static const semibold = 'MontserratSemiBold';
}

class Space {
  num top = 0;
  num bottom = 0;
  num left = 0;
  num right = 0;

  Space({this.top, this.bottom, this.left, this.right, all}) {
    if (null != all) {
      top = all;
      bottom = all;
      left = all;
      right = all;
    }
  }
}

class Size {
  num width = 0;
  num height = 0;

  Size({this.width, this.height});
}

class OneGradient {
  Alignment begin, end = Alignment.center;

  OneGradient({this.begin, this.end});
}

class FontStyle {
  String family;
  double size;

  FontStyle(Map<String, dynamic> font) {
    family = font['family'];
    size = font['size'];
  }

  static var h0 = FontStyle({
    'family': FontFamilies.bold,
    'size': 24.0,
  });

  static var h0r = FontStyle({
    'family': FontFamilies.regular,
    'size': 24.0,
  });

  static var h0s = FontStyle({
    'family': FontFamilies.semibold,
    'size': 24.0,
  });

  static var h4r = FontStyle({
    'family': FontFamilies.regular,
    'size': 20.0,
  });

  static var h4b = FontStyle({
    'family': FontFamilies.bold,
    'size': 20.0,
  });

  static var h1 = FontStyle({
    'family': FontFamilies.bold,
    'size': 18.0,
  });

  static var h2 = FontStyle({
    'family': FontFamilies.semibold,
    'size': 16.0,
  });

  static var h2b = FontStyle({
    'family': FontFamilies.bold,
    'size': 16.0,
  });

  static var h2r = FontStyle({
    'family': FontFamilies.regular,
    'size': 16.0,
  });

  static var h3s = FontStyle({
    'family': FontFamilies.semibold,
    'size': 14.0,
  });

  static var h3 = FontStyle({
    'family': FontFamilies.regular,
    'size': 14.0,
  });

  static var h4s = FontStyle({
    'family': FontFamilies.semibold,
    'size': 20.0,
  });

  static var p1 = FontStyle({
    'family': FontFamilies.bold,
    'size': 14.0,
  });

  static var p2 = FontStyle({
    'family': FontFamilies.semibold,
    'size': 12.0,
  });

  static var p2b = FontStyle({
    'family': FontFamilies.bold,
    'size': 12.0,
  });

  static var p2r = FontStyle({
    'family': FontFamilies.regular,
    'size': 12.0,
  });

  static var p3 = FontStyle({
    'family': FontFamilies.regular,
    'size': 11.0,
  });

  static var p4 = FontStyle({
    'family': FontFamilies.bold,
    'size': 10.0,
  });

  static var p4s = FontStyle({
    'family': FontFamilies.semibold,
    'size': 10.0,
  });

  static var p4r = FontStyle({
    'family': FontFamilies.regular,
    'size': 10.0,
  });

  static var p5 = FontStyle({
    'family': FontFamilies.regular,
    'size': 9.0,
  });

  static var p6 = FontStyle({
    'family': FontFamilies.regular,
    'size': 8.0,
  });

  static var p6b = FontStyle({
    'family': FontFamilies.bold,
    'size': 8.0,
  });

  static var p7 = FontStyle({
    'family': FontFamilies.regular,
    'size': 7.0,
  });

  static var h5b = FontStyle({
    'family': FontFamilies.bold,
    'size': 25.0,
  });
}
