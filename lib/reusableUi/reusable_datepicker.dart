import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ginFinans/reusableUi/base_style.dart';
import 'package:ginFinans/reusableUi/reusable_dropdown_style.dart';
import 'package:ginFinans/reusableUi/reusable_textview.dart';
import 'package:ginFinans/util/palette.dart';

// ignore: must_be_immutable
class ReusableDatePicker extends StatelessWidget {
  ReusableDatePicker({
    this.title,
    this.pressHandler,
    this.value,
    this.options,
    this.isEnabled = true,
    this.mode,
    this.datePickerFormat,
    style,
  }) {
    _margin = style['margin'];
  }
  final CupertinoDatePickerMode mode;
  final Function pressHandler;
  final List<String> options;
  final String title, value, datePickerFormat;
  final bool isEnabled;
  Map<String, dynamic> style;
  Space _margin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          pressHandler(context, datePickerFormat, mode);
        },
        child: Padding(
            padding: EdgeInsets.only(
                top: _margin?.top?.toDouble() ?? 0,
                bottom: _margin?.bottom?.toDouble() ?? 0,
                left: _margin?.left?.toDouble() ?? 0,
                right: _margin?.right?.toDouble() ?? 0),
            child: Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Palette.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ReusableTextView(
                              text: title,
                              style: ReusableDropDownStyle.titleDropDownStyle,
                            ),
                            ReusableTextView(
                              text: value,
                              style: ReusableDropDownStyle.valueDropDownStyle,
                            ),
                          ]),
                      Center(
                          child: Container(
                              margin: EdgeInsets.only(right: 14),
                              child: Icon(Icons.keyboard_arrow_down_outlined,
                                  color: Colors.grey)))
                    ]))));
  }
}
