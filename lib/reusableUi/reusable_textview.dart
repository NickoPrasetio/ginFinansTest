import 'package:flutter/material.dart';
import 'package:ginFinans/reusableUi/base_style.dart';

// ignore: must_be_immutable
class ReusableTextView extends StatelessWidget {
  ReusableTextView({this.pressHandler, this.text, style}) {
    _fontStyle = style['fontStyle'];
    _fontColor = style['fontColor'];
    _maxLines = style['maxLines'];
    _overflow = style['overflow'];
    _margin = style['margin'];
    _textAlign = style['textAlign'];
    _lineSpacing = style['lineSpacing'];
    _textDirection = style['textDirection'];
  }

  final Function pressHandler;
  final String text;
  FontStyle _fontStyle;
  Color _fontColor;
  num _maxLines, _lineSpacing;
  TextOverflow _overflow;
  Space _margin;
  TextAlign _textAlign;
  TextDirection _textDirection;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: _margin?.top?.toDouble() ?? 0,
          bottom: _margin?.bottom?.toDouble() ?? 0,
          left: _margin?.left?.toDouble() ?? 0,
          right: _margin?.right?.toDouble() ?? 0),
      child: Container(
        child: GestureDetector(
            onTap: pressHandler,
            child: Text(
              text,
              textDirection: _textDirection,
              style: TextStyle(
                  height: _lineSpacing,
                  fontFamily: _fontStyle.family,
                  fontSize: _fontStyle.size,
                  color: _fontColor),
              textAlign: _textAlign,
              overflow: _overflow,
              maxLines: _maxLines,
            )),
      ),
    );
  }
}