import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ginFinans/module/base_module.dart';
import 'package:ginFinans/presentation/schedulePage/bloc/schedule_page_bloc.dart';
import 'package:ginFinans/presentation/schedulePage/bloc/schedule_page_event.dart';
import 'package:ginFinans/presentation/schedulePage/bloc/schedule_page_state.dart';
import 'package:ginFinans/presentation/schedulePage/style/schedule_page_style.dart';
import 'package:ginFinans/reusableUi/calendar_animation.dart';
import 'package:ginFinans/reusableUi/circle_progress.dart';
import 'package:ginFinans/reusableUi/reusable_button.dart';
import 'package:ginFinans/reusableUi/reusable_datepicker.dart';
import 'package:ginFinans/reusableUi/reusable_textview.dart';
import 'package:ginFinans/util/constants.dart';
import 'package:ginFinans/util/date_parser.dart';

import 'package:ginFinans/util/i18n.dart';
import 'package:ginFinans/util/palette.dart';
import 'package:ginFinans/viewModel/user_model.dart';

class SchedulePage extends StatelessWidget {
  final UserModel userModel;
  const SchedulePage({Key key, this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Palette.skyBlue,
          title: Text(I18n.getText(context, 'textAppBarAccount'))),
      resizeToAvoidBottomPadding: false,
      body: BlocProvider(
        create: (context) =>
            injector.get<SchedulePageBloc>()..add(WelcomeInit()),
        child: SchedulePageWidget(userModel: userModel),
      ),
    );
  }
}

class SchedulePageWidget extends StatefulWidget {
  final UserModel userModel;
  const SchedulePageWidget({this.userModel});

  @override
  _WelcomePageWidgetState createState() => _WelcomePageWidgetState();
}

class _WelcomePageWidgetState extends State<SchedulePageWidget> {
  SchedulePageBloc _schedulePageBloc;
  SchedulePageStyle _schedulePageStyle = SchedulePageStyle();
  String _selectedDate, _selectedTime;
  bool _isValidSchedule;
  UserModel _userModel;

  @override
  void initState() {
    super.initState();
    _userModel = widget.userModel;
    _schedulePageBloc = BlocProvider.of<SchedulePageBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SchedulePageBloc, SchedulePageState>(
        cubit: _schedulePageBloc,
        builder: (BuildContext context, SchedulePageState state) {
          _mapState(state);
          return Container(
              color: Palette.skyBlue,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleProgress(total: 4, step: 3),
                    Container(
                        color: Palette.skyBlue,
                        margin: EdgeInsets.only(left: 35, bottom: 30),
                        height: 25,
                        width: 25,
                        child: CalendarAnimation()),
                    ReusableTextView(
                      text: I18n.getText(context, 'textScheduleVideoTitle'),
                      style: _schedulePageStyle.scheduleInfoTitleTextStyle,
                    ),
                    ReusableTextView(
                      text: I18n.getText(context, 'textScheduleVideoSubtitle'),
                      style: _schedulePageStyle.scheduleInfoSubTitleTextStyle,
                    ),
                    ReusableDatePicker(
                        pressHandler: _showDatePicker,
                        mode: CupertinoDatePickerMode.date,
                        datePickerFormat: DateParser.ddMMMyyyy,
                        title: I18n.getText(context, 'textDate'),
                        value: _selectedDate,
                        style: _schedulePageStyle.dropDownStyle),
                    ReusableDatePicker(
                        pressHandler: _showDatePicker,
                        mode: CupertinoDatePickerMode.time,
                        datePickerFormat: DateParser.hhmm,
                        title: I18n.getText(context, 'textTime'),
                        value: _selectedTime,
                        style: _schedulePageStyle.upperDownStyle),
                    Expanded(
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: ReusableButton(
                              isEnabled: _isValidSchedule,
                              text: I18n.getText(context, 'textClose'),
                              style: _schedulePageStyle.submitEmailButtonStyle,
                              pressHandler: () {
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    child: Container(child: _finalDialog()));
                              },
                            )))
                  ]));
        });
  }

  Widget _finalDialog() {
    return Center(
        child: Container(
            height: 450,
            width: 200,
            color: Palette.white,
            child: Column(children: <Widget>[
              ReusableTextView(
                text: _userModel.email,
                style: _schedulePageStyle.resultTextStyle,
              ),
              ReusableTextView(
                text: _userModel.password,
                style: _schedulePageStyle.resultTextStyle,
              ),
              ReusableTextView(
                text: _userModel.goal,
                style: _schedulePageStyle.resultTextStyle,
              ),
              ReusableTextView(
                text: _userModel.income,
                style: _schedulePageStyle.resultTextStyle,
              ),
              ReusableTextView(
                text: _userModel.expense,
                style: _schedulePageStyle.resultTextStyle,
              ),
              ReusableTextView(
                text: _userModel.scheduleDate,
                style: _schedulePageStyle.resultTextStyle,
              ),
              ReusableTextView(
                text: _userModel.scheduleTime,
                style: _schedulePageStyle.resultTextStyle,
              ),
              ReusableButton(
                isEnabled: _isValidSchedule,
                text: I18n.getText(context, 'textClose'),
                style: _schedulePageStyle.submitEmailButtonStyle,
                pressHandler: () {
                  Navigator.of(context).pop();
                },
              )
            ])));
  }

  void _mapState(SchedulePageState state) {
    if (state is ScheduleLoaded) {
      _isValidSchedule = state.isValidSchedule;
      _selectedDate = state.date;
      _selectedTime = state.time;
      _userModel.scheduleDate = state.date;
      _userModel.scheduleTime = state.time;
    } else {
      _isValidSchedule = false;
      _selectedDate = Constants.defaultOptionValue;
      _selectedTime = Constants.defaultOptionValue;
    }
  }

  void _showDatePicker(
      context, String formatter, CupertinoDatePickerMode mode) {
    if (Platform.isAndroid) {
      _selectDateTimeMaterial(context, formatter, mode);
    } else {
      String _defValue = DateParser.parseDate(DateTime.now(), formatter);
      showCupertinoModalPopup(
          context: context,
          builder: (_) => Container(
                height: 500,
                color: Color.fromARGB(255, 255, 255, 255),
                child: Column(
                  children: [
                    Container(
                      height: 400,
                      child: CupertinoDatePicker(
                          mode: mode,
                          initialDateTime: DateTime.now(),
                          onDateTimeChanged: (val) {
                            _defValue =
                                DateParser.parseDate(val, formatter).toString();
                          }),
                    ),
                    ReusableButton(
                      text: I18n.getText(context, 'textNext'),
                      style: _schedulePageStyle.submitEmailButtonStyle,
                      pressHandler: () {
                        _updateDateTime(_defValue, mode);
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              ));
    }
  }

  Future<void> _selectDateTimeMaterial(BuildContext context, String formatter,
      CupertinoDatePickerMode mode) async {
    if (mode == CupertinoDatePickerMode.date) {
      DateTime selectedDate = DateTime.now();
      final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.blue,
                primaryColorDark: Colors.blue,
                accentColor: Colors.blue,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: child,
          );
        },
      );
      if (picked != null && picked != selectedDate)
        setState(() {
          selectedDate = picked;
          final selectedDateString =
              DateParser.parseDate(selectedDate, formatter);
          _updateDateTime(selectedDateString, mode);
        });
    } else {
      TimeOfDay selectedTime = TimeOfDay.now();
      TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.blue,
                primaryColorDark: Colors.blue,
                accentColor: Colors.blue,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: child,
          );
        },
      );
      if (picked != null)
        setState(() {
          selectedTime = picked;
          final localizations = MaterialLocalizations.of(context);
          final formattedTimeOfDay =
              localizations.formatTimeOfDay(selectedTime);
          _updateDateTime(formattedTimeOfDay, mode);
        });
    }
  }

  void _updateDateTime(String value, CupertinoDatePickerMode mode) {
    if (mode == CupertinoDatePickerMode.date) {
      _schedulePageBloc.add(UpdateValue(date: value, time: _selectedTime));
    } else {
      _schedulePageBloc.add(UpdateValue(date: _selectedDate, time: value));
    }
  }
}
