import 'package:flutter/material.dart';
import 'package:ginFinans/reusableUi/base_style.dart';
import 'package:ginFinans/reusableUi/reusable_button_style.dart';
import 'package:ginFinans/reusableUi/reusable_text_field_style.dart';
import 'package:ginFinans/reusableUi/reusable_textview_style.dart';
import 'package:ginFinans/util/palette.dart';

class WelcomePageStyle {
  var emailStyle = {
    ...ReusableTextFieldStyle.textFieldStyle,
    'keyboardType': TextInputType.emailAddress,
    'inputFormat': null,
    'margin': Space(left: 24, right: 24),
  };

  var welcomeSubtitleTextStyle = {
    ...ReusableTextViewStyle.h2bStyle,
    'fontColor': Palette.black,
    'maxLines': 3,
    'margin': Space(bottom: 24, left: 24),
  };

  var submitEmailButtonStyle = {
    ...ReusableButtonStyle.primaryButtonStyle,
    'margin': Space(bottom: 40, left: 24, right: 24),
  };
}
