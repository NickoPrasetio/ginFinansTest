import 'package:flutter/material.dart';
import 'package:ginFinans/reusableUi/base_style.dart';
import 'package:ginFinans/reusableUi/reusable_button_style.dart';
import 'package:ginFinans/reusableUi/reusable_text_field_style.dart';
import 'package:ginFinans/reusableUi/reusable_textview_style.dart';
import 'package:ginFinans/util/palette.dart';

class PasswordPageStyle {
  var passwordTextFieldStyle = {
    ...ReusableTextFieldStyle.textFieldStyle,
    'keyboardType': TextInputType.emailAddress,
    'inputFormat': null,
    'margin': Space(left: 24, right: 24),
  };

  var complexityTitleTextStyle = {
    ...ReusableTextViewStyle.textAreaP2rStyle,
    'fontColor': Palette.white,
    'maxLines': 1,
    'margin': Space(top: 5, left: 24),
  };

  var passwordTitleTextStyle = {
    ...ReusableTextViewStyle.textAreaH2BStyle,
    'fontColor': Palette.white,
    'maxLines': 1,
    'margin': Space(top: 24, left: 24),
  };

  var passwordSubtitleTextStyle = {
    ...ReusableTextViewStyle.p2rStyle,
    'fontColor': Palette.white,
    'maxLines': 2,
    'margin': Space(top: 10, left: 24),
  };

  var complexityTextStyle = {
    ...ReusableTextViewStyle.p2rStyle,
    'fontColor': Palette.white,
    'maxLines': 1,
    'margin': Space(top: 5, left: 24),
  };

  var complexityValueTextStyle = {
    ...ReusableTextViewStyle.p2Style,
    'fontColor': Palette.goldYellow,
    'maxLines': 1,
    'margin': Space(top: 5, left: 5),
  };

  var complexityItemTextStyle = {
    ...ReusableTextViewStyle.textAreaP3Style,
    'fontColor': Palette.white,
    'maxLines': 1,
    'margin': Space(left: 4, top: 4),
  };

  var complexityItemAlphabetStyle = {
    ...ReusableTextViewStyle.textAreaH4RStyle,
    'fontColor': Palette.white,
    'maxLines': 1,
    'margin': Space(left: 4),
  };

  var submitPasswordButtonStyle = {
    ...ReusableButtonStyle.primaryButtonStyle,
    'margin': Space(bottom: 40, left: 24, right: 24),
  };
}
