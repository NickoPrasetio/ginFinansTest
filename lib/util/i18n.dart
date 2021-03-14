import 'package:flutter/material.dart';
import 'package:ginFinans/util/app_localization.dart';
import 'package:sprintf/sprintf.dart';

class I18n {
  static const defaultArgs = [''];

  static String getText(BuildContext context, String key,
      {args = defaultArgs}) {
    return sprintf(AppLocalization.of(context).translate(key), args);
  }
}
