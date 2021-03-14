import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ginFinans/reusableUi/base_style.dart';
import 'package:ginFinans/reusableUi/reusable_dropdown_style.dart';
import 'package:ginFinans/reusableUi/reusable_textview.dart';
import 'package:ginFinans/util/date_parser.dart';
import 'package:ginFinans/util/palette.dart';

// ignore: must_be_immutable
class ReusableDropdown extends StatelessWidget {
  ReusableDropdown({
    this.title,
    this.pressHandler,
    this.value,
    this.options,
    this.isEnabled = true,
    style,
  }) {
    _margin = style['margin'];
  }

  final Function pressHandler;
  final List<String> options;
  final String title, value;
  final bool isEnabled;
  Map<String, dynamic> style;
  Space _margin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          _settingModalBottomSheet(context, pressHandler);
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

  void _settingModalBottomSheet(context, Function pressHandler) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        backgroundColor: Colors.white,
        context: context,
        builder: (BuildContext bc) {
          return Container(
              margin: const EdgeInsets.only(
                  top: 20, left: 24, bottom: 20, right: 24),
              child: ListView.separated(
                  separatorBuilder: (context, index) => Container(
                      margin: const EdgeInsets.only(left: 15, right: 15),
                      child: Divider(color: Palette.hardGray, thickness: 1.0)),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: options.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: () {
                          pressHandler(options[index]);
                          Navigator.of(context).pop();
                        },
                        child: ReusableTextView(
                            text: options[index],
                            style: ReusableDropDownStyle.optionsDropDownStyle));
                  }));
        });
  }
}
