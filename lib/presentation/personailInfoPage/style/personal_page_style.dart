import 'package:flutter/material.dart';
import 'package:ginFinans/reusableUi/base_style.dart';
import 'package:ginFinans/reusableUi/reusable_button_style.dart';
import 'package:ginFinans/reusableUi/reusable_text_field_style.dart';
import 'package:ginFinans/reusableUi/reusable_textview_style.dart';
import 'package:ginFinans/util/palette.dart';

class PersonalPageStyle {
  var emailStyle = {
    ...ReusableTextFieldStyle.textFieldStyle,
    'keyboardType': TextInputType.emailAddress,
    'inputFormat': null,
    'margin': Space(left: 15, right: 15),
  };

  var personalInfoTitleTextStyle = {
    ...ReusableTextViewStyle.textAreaH2BStyle,
    'fontColor': Palette.white,
    'maxLines': 1,
    'margin': Space(bottom: 24, left: 24),
  };

  var personalInfoSubTitleTextStyle = {
    ...ReusableTextViewStyle.p2rStyle,
    'fontColor': Palette.white,
    'maxLines': 2,
    'margin': Space(bottom: 24, left: 24),
  };

  var dropDownStyle = {
    'margin': Space(right: 24, left: 24, top: 8, bottom: 8),
  };

  var submitEmailButtonStyle = {
    ...ReusableButtonStyle.primaryButtonStyle,
    'margin': Space(bottom: 40, left: 24, right: 24),
  };
}
