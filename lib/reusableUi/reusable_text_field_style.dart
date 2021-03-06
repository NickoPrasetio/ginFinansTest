import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ginFinans/reusableUi/base_style.dart';
import 'package:ginFinans/reusableUi/reusable_textview_style.dart';
import 'package:ginFinans/util/palette.dart';

abstract class ReusableTextFieldStyle {
  static var textFieldStyle = {
    'size': Size(height: 30, width: double.infinity),
    'fontColor': Palette.black,
    'fontStyle': FontStyle.p1,
    'keyboardType': TextInputType.text,
    'inputLength':
        LengthLimitingTextInputFormatter(30),
    'inputFormat': null,
    'fontColorLabel': Palette.black,
    'fontStyleLabel': FontStyle.p2r,
    'fontColorHint': Palette.hardGray,
    'fontStyleHint': FontStyle.p2r,
    'fontColorError': Palette.orangeRed,
    'fontStyleError': FontStyle.p4r,
    'obscureText': false,
    'withFullBorder': false,
    'letterSpacing': 0,
    'withBorder': true,
    'margin': Space(top: 0),
    'iconColor': Palette.hardGray,
    'readOnly': false,
    'actionTextStyle': {
      ...ReusableTextViewStyle.textAreaH4SStyle,
      'fontColor': Palette.gray,
    },
    'textAlign': TextAlign.start,
    'maxLines': 1,
  };

  static var invisiblePasswordFieldStyle = {
    ...textFieldStyle,
    'inputLength':
        LengthLimitingTextInputFormatter(10),
    'iconEnd': const Icon(Icons.visibility),
  };

  static var visiblePasswordFieldStyle = {
    ...invisiblePasswordFieldStyle,
    'iconEnd': const Icon(Icons.visibility_off),
    'obscureText': true,
  };
}
