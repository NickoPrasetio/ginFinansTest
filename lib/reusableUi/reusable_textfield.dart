import 'package:flutter/material.dart';
import 'package:ginFinans/reusableUi/base_style.dart';
import 'package:ginFinans/util/palette.dart';

// ignore: must_be_immutable
class ReusableTextField extends StatelessWidget {
  ReusableTextField({
    this.pressHandler,
    this.iconPath,
    this.labelText,
    this.hintText,
    this.obscureText,
    this.errorText = '',
    this.isValid = true,
    this.textChangeHandler,
    this.style,
  }) {
    _size = style['size'];
    _fontStyle = style['fontStyle'];
    _fontColor = style['fontColor'];
    _fontStyleHint = style['fontStyleHint'];
    _fontColorHint = style['fontColorHint'];
    _letterSpacing = style['letterSpacing'];
    _margin = style['margin'];
    _maxLines = style['maxLines'];
  }

  Function pressHandler;
  final String labelText, hintText, errorText, iconPath;
  Size _size;
  FontStyle _fontStyle, _fontStyleHint;
  Color _fontColor, _fontColorHint;
  Space _margin;
  bool obscureText, isValid, isEnabl;
  TextEditingController textChangeHandler;
  num _letterSpacing, _maxLines;
  Map<String, dynamic> style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: _margin?.top?.toDouble() ?? 0,
          bottom: _margin?.bottom?.toDouble() ?? 0,
          left: _margin?.left?.toDouble() ?? 0,
          right: _margin?.right?.toDouble() ?? 0),
      child: SizedBox(
          width: double.infinity,
          height: 100.0,
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            height: _size?.height?.toDouble(),
            width: _size?.width?.toDouble(),
            child: TextFormField(
              maxLines: _maxLines,
              cursorColor: _fontColor,
              controller: textChangeHandler,
              obscureText: obscureText,
              style: TextStyle(
                letterSpacing: _letterSpacing?.toDouble() ?? 0,
                fontFamily: _fontStyle.family,
                fontSize: _fontStyle.size,
                color: _fontColor,
              ),
              decoration: InputDecoration(
                errorText: isValid ? '' : errorText,
                filled: true,
                fillColor: Palette.softGrey,
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                  fontFamily: _fontStyleHint.family,
                  fontSize: _fontStyleHint.size,
                  color: _fontColorHint,
                ),
                suffixIcon: generateIconButton(),
                prefixIcon: Container(padding: EdgeInsets.only(bottom: 5), child: Icon(Icons.email, color: Colors.grey)),
              ),
            ),
          )),
    );
  }

    IconButton generateIconButton() {
    return IconButton(
      padding: const EdgeInsets.only(left: 8, right: 8),
      alignment: Alignment.centerRight,
      icon: Icon(Icons.remove_red_eye, color: Colors.grey),
      onPressed: pressHandler,
      color: Palette.gray,
      autofocus: true,
    );
  }
}
