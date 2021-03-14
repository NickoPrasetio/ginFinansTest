import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ginFinans/reusableUi/base_style.dart';

import 'package:ginFinans/util/palette.dart';

// ignore: must_be_immutable
class ReusableTextField extends StatelessWidget {
  ReusableTextField({
    this.pressHandler,
    this.labelText,
    this.hintText,
    this.errorText = '',
    this.isValid,
    this.textChangeHandler,
    this.iconPath,
    this.style,
    this.onTap,
    this.prefixWidget,
    this.suffixWidget,
    this.submitHandler,
  }) {
    _obscureText = style['obscureText'];
    _margin = style['margin'];
  }

  final Function pressHandler, onTap;
  bool isValidEmail;
  Function submitHandler;
  final String labelText, hintText, errorText, iconPath;
  Widget suffixWidget;
  Widget prefixWidget;

  Space _margin;
  bool _obscureText, isValid, isEnable = true;
  TextEditingController textChangeHandler;
  Map<String, dynamic> style;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            top: _margin?.top?.toDouble() ?? 0,
            bottom: _margin?.bottom?.toDouble() ?? 0,
            left: _margin?.left?.toDouble() ?? 0,
            right: _margin?.right?.toDouble() ?? 0),
        child: isValid
            ? TextField(
                autocorrect: true,
                decoration: InputDecoration(
                    hintText: hintText,
                    prefixIcon: Icon(Icons.email, color: Colors.grey),
                    suffixIcon: Icon(Icons.lock, color: Colors.grey),
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Palette.softGrey))
            : TextField(
                autocorrect: true,
                decoration: InputDecoration(
                    hintText: hintText,
                    prefixIcon: Icon(Icons.email, color: Colors.grey),
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Palette.softGrey,
                    errorStyle: TextStyle(),
                    errorText: 'Please enter something',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.red[700],
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.red[700],
                        ))),
              ));
  }
}

class CommaTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String truncated = newValue.text;
    final TextSelection newSelection = newValue.selection;

    if (newValue.text.contains('.')) {
      truncated = newValue.text.replaceAll('.', ',');
    }
    return TextEditingValue(
      text: truncated,
      selection: newSelection,
    );
  }
}
