import 'package:flutter/material.dart';
import 'package:ginFinans/reusableUi/base_style.dart';
import 'package:ginFinans/util/palette.dart';

// ignore: must_be_immutable
class ReusableButton extends StatelessWidget {
  ReusableButton({
    this.pressHandler,
    this.text,
    this.isEnabled = true,
    style,
  }) {
    _size = style['size'];
    _color = isEnabled ? style['color'] : Palette.gray;
    _borderRadiusRectangle = style['borderRadiusRectangle'];
    _fontColor = isEnabled ? style['fontColor'] : Palette.dark;
    _borderColor = style['borderColor'];
    _borderWidth = style['borderWidth'];
    _fontStyle = style['fontStyle'];
    _contAlignment = style['contAlignment'];
    _margin = style['margin'];
  }

  final Function pressHandler;
  final String text;
  final bool isEnabled;
  Size _size;
  Space _margin;
  FontStyle _fontStyle;
  Alignment _contAlignment;
  Color _fontColor, _color, _borderColor;
  double _borderWidth;
  num _borderRadiusRectangle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: _margin?.top?.toDouble() ?? 0,
          bottom: _margin?.bottom?.toDouble() ?? 0,
          left: _margin?.left?.toDouble() ?? 0,
          right: _margin?.right?.toDouble() ?? 0),
      child: Container(
        height: _size.height.toDouble(),
        width: _size.width.toDouble(),
        child: RaisedButton(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: null != _borderColor
                ? BorderSide(
                    width: _borderWidth,
                    color: _borderColor,
                  )
                : BorderSide.none,
            borderRadius:
                BorderRadius.circular(_borderRadiusRectangle.toDouble()),
          ),
          onPressed: isEnabled ? pressHandler : null,
          padding: const EdgeInsets.all(0),
          child: Ink(
            decoration: BoxDecoration(
              color: _color,
              borderRadius:
                  BorderRadius.circular(_borderRadiusRectangle.toDouble()),
            ),
            child: Container(
              width: _size.width.toDouble(),
              height: _size.height.toDouble(),
              alignment: _contAlignment,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 15, left: 15),
                        child: Text(
                          text,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: _fontStyle.family,
                              fontSize: _fontStyle.size,
                              color: _fontColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
