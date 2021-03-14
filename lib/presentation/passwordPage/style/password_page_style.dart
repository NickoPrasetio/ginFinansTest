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
    'margin': Space(bottom: 24, left: 24),
  };

  var passwordTitleTextStyle = {
    ...ReusableTextViewStyle.textAreaH2BStyle,
    'fontColor': Palette.white,
    'maxLines': 1,
    'margin': Space(bottom: 24, left: 24),
  };

  var passwordSubtitleTextStyle = {
    ...ReusableTextViewStyle.p2rStyle,
    'fontColor': Palette.white,
    'maxLines': 2,
    'margin': Space(bottom: 24, left: 24),
  };

  var complexityTextStyle = {
    ...ReusableTextViewStyle.p2rStyle,
    'fontColor': Palette.white,
    'maxLines': 1,
    'margin': Space(bottom: 24, left: 24),
  };

  var complexityValueWeakTextStyle = {
    ...ReusableTextViewStyle.p2rStyle,
    'fontColor': Palette.goldYellow,
    'maxLines': 1,
    'margin': Space(bottom: 24, left: 24),
  };

  var complexityValueStrongTextStyle = {
    ...ReusableTextViewStyle.p2rStyle,
    'fontColor': Palette.checklistGreen,
    'maxLines': 1,
    'margin': Space(bottom: 24, left: 24),
  };

  var complexityItemTextStyle = {
    ...ReusableTextViewStyle.textAreaP3Style,
    'fontColor': Palette.white,
    'maxLines': 1,
    'margin': Space(bottom: 4, left: 4, top: 4),
  };

  var complexityItemAlphabetStyle = {
    ...ReusableTextViewStyle.textAreaH4RStyle,
    'fontColor': Palette.white,
    'maxLines': 1,
    'margin': Space(bottom: 4, left: 4),
  };

  var submitEmailButtonStyle = {
    ...ReusableButtonStyle.primaryButtonStyle,
    'margin': Space(bottom: 40, left: 24, right: 24),
  };
}
