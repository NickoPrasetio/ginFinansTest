import 'package:flutter/material.dart';
import 'package:ginFinans/reusableUi/base_style.dart';
import 'package:ginFinans/util/palette.dart';

abstract class ReusableTextViewStyle {
  static var textViewStyle = {
    'fontColor': Palette.black,
    'fontStyle': FontStyle.h1,
    'maxLines': 1,
    'overflow': TextOverflow.ellipsis,
    'textAlign': TextAlign.start,
    'lineSpacing': 1.5,
    'margin': Space(top: 0),
  };

  static var h0Style = {
    ...textViewStyle,
    'fontStyle': FontStyle.h0,
  };

  static var h0sStyle = {
    ...textViewStyle,
    'fontStyle': FontStyle.h0s,
  };

  static var h0rStyle = {
    ...textViewStyle,
    'fontStyle': FontStyle.h0r,
  };

  static var h1Style = {
    ...textViewStyle,
    'fontStyle': FontStyle.h1,
  };

  static var h2Style = {
    ...textViewStyle,
    'fontStyle': FontStyle.h2,
  };

  static var h2bStyle = {
    ...textViewStyle,
    'fontStyle': FontStyle.h2b,
  };

  static var h2rStyle = {
    ...textViewStyle,
    'fontStyle': FontStyle.h2r,
  };

  static var h3sStyle = {
    ...textViewStyle,
    'fontStyle': FontStyle.h3s,
  };

  static var h3Style = {
    ...textViewStyle,
    'fontStyle': FontStyle.h3,
  };

  static var h4sStyle = {
    ...textViewStyle,
    'fontStyle': FontStyle.h4s,
  };

  static var h4rStyle = {
    ...textViewStyle,
    'fontStyle': FontStyle.h4r,
  };

  static var h4bStyle = {
    ...textViewStyle,
    'fontStyle': FontStyle.h4b,
  };

  static var p1Style = {
    ...textViewStyle,
    'fontStyle': FontStyle.p1,
  };

  static var p2Style = {
    ...textViewStyle,
    'fontStyle': FontStyle.p2,
  };

  static var p2bStyle = {
    ...textViewStyle,
    'fontStyle': FontStyle.p2b,
  };

  static var p2rStyle = {
    ...textViewStyle,
    'fontStyle': FontStyle.p2r,
  };

  static var p3Style = {
    ...textViewStyle,
    'fontStyle': FontStyle.p3,
  };

  static var p4rStyle = {
    ...textViewStyle,
    'fontStyle': FontStyle.p4r,
  };

  static var p4sStyle = {
    ...textViewStyle,
    'fontStyle': FontStyle.p4s,
  };

  static var p6Style = {
    ...textViewStyle,
    'fontStyle': FontStyle.p6,
  };

  static var textAreaStyle = {
    ...textViewStyle,
    'fontStyle': FontStyle.h1,
    'maxLines': null,
    'overflow': null,
    'textAlign': TextAlign.start,
  };

  static var textAreaH0Style = {
    ...textAreaStyle,
    'fontStyle': FontStyle.h0,
  };

  static var textAreaH0rStyle = {
    ...textAreaStyle,
    'fontStyle': FontStyle.h0r,
  };

  static var textAreaH2Style = {
    ...textAreaStyle,
    'fontStyle': FontStyle.h2,
  };

  static var textAreaH2BStyle = {
    ...textAreaStyle,
    'fontStyle': FontStyle.h2b,
  };

  static var textAreaH2rStyle = {
    ...textAreaStyle,
    'fontStyle': FontStyle.h2r,
  };

  static var textAreaH3Style = {
    ...textAreaStyle,
    'fontStyle': FontStyle.h3,
  };

  static var textAreaH3sStyle = {
    ...textAreaStyle,
    'fontStyle': FontStyle.h3s,
  };

  static var textAreaH4RStyle = {
    ...textAreaStyle,
    'fontStyle': FontStyle.h4r,
  };

  static var textAreaH4SStyle = {
    ...textAreaStyle,
    'fontStyle': FontStyle.h4s,
  };

  static var textAreaH3SBStyle = {
    ...textAreaStyle,
    'fontStyle': FontStyle.h3s,
  };

  static var textAreaP1Style = {
    ...textAreaStyle,
    'fontStyle': FontStyle.p1,
  };

  static var textAreaP2Style = {
    ...textAreaStyle,
    'fontStyle': FontStyle.p2,
  };

  static var textAreaP2rStyle = {
    ...textAreaStyle,
    'fontStyle': FontStyle.p2r,
  };

  static var textAreaP3Style = {
    ...textAreaStyle,
    'fontStyle': FontStyle.p3,
  };

  static var textAreaP4rStyle = {
    ...textAreaStyle,
    'fontStyle': FontStyle.p4r,
  };

  static var textAreaP6Style = {
    ...textAreaStyle,
    'fontStyle': FontStyle.p6,
  };

   static var textAreaP6bStyle = {
    ...textAreaStyle,
    'fontStyle': FontStyle.p6b,
  };


  static var textAreaH0SStyle = {
    ...textAreaStyle,
    'fontStyle': FontStyle.h0s,
  };

  static var textAreaP5rStyle = {
    ...textAreaStyle,
    'fontStyle': FontStyle.p5,
  };
}
