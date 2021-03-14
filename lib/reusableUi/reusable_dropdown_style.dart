import 'package:ginFinans/reusableUi/base_style.dart';
import 'package:ginFinans/reusableUi/reusable_textview_style.dart';
import 'package:ginFinans/util/palette.dart';

abstract class ReusableDropDownStyle {
  static var titleDropDownStyle = {
    ...ReusableTextViewStyle.textAreaP3Style,
    'fontColor': Palette.hardGray,
    'margin': Space(top: 5, left: 14),
  };

  static var valueDropDownStyle = {
    ...ReusableTextViewStyle.textAreaH3sStyle,
    'fontColor': Palette.black,
    'margin': Space(left: 14),
  };

  static var optionsDropDownStyle = {
    ...ReusableTextViewStyle.textAreaH3sStyle,
    'fontColor': Palette.hardGray,
    'margin': Space(top: 5, bottom: 5, left: 14),
  };
}
