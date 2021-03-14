import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ginFinans/module/base_module.dart';
import 'package:ginFinans/presentation/personailInfoPage/bloc/personal_page_bloc.dart';
import 'package:ginFinans/presentation/personailInfoPage/bloc/personal_page_event.dart';
import 'package:ginFinans/presentation/personailInfoPage/bloc/personal_page_state.dart';
import 'package:ginFinans/presentation/personailInfoPage/style/personal_page_style.dart';
import 'package:ginFinans/reusableUi/reusable_button.dart';
import 'package:ginFinans/reusableUi/reusable_dropdown.dart';
import 'package:ginFinans/reusableUi/reusable_textview.dart';

import 'package:ginFinans/util/i18n.dart';
import 'package:ginFinans/util/palette.dart';
import 'package:ginFinans/util/routes.dart';

class PersonalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Palette.skyBlue,
          title: Text(I18n.getText(context, 'textAppBarAccount'))),
      resizeToAvoidBottomPadding: false,
      body: BlocProvider(
        create: (context) =>
            injector.get<PersonalPageBloc>()..add(WelcomeInit()),
        child: PersonalPageWidget(),
      ),
    );
  }
}

class PersonalPageWidget extends StatefulWidget {
  @override
  _PersonalPageWidgetState createState() => _PersonalPageWidgetState();
}

class _PersonalPageWidgetState extends State<PersonalPageWidget> {
  PersonalPageBloc _personalPageBloc;
  PersonalPageStyle _personalPageStyle = PersonalPageStyle();
  String _goalSelected, _monthlyIncomeSelected, _monthlyExpenseSelected;
  List<String> _goalOptions, _monthlyIncomeOptions, _monthlyExpenseOptions;

  @override
  void initState() {
    super.initState();
    _initOptions();
    _personalPageBloc = BlocProvider.of<PersonalPageBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonalPageBloc, PersonalPageState>(
        cubit: _personalPageBloc,
        builder: (BuildContext context, PersonalPageState state) {
          _mapState(context, state);
          return Container(
              color: Palette.skyBlue,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ReusableTextView(
                      text: I18n.getText(context, 'textPersonalInfoTitle'),
                      style: _personalPageStyle.personalInfoTitleTextStyle,
                    ),
                    ReusableTextView(
                      text: I18n.getText(context, 'textPersonalInfoSubtitle'),
                      style: _personalPageStyle.personalInfoSubTitleTextStyle,
                    ),
                    ReusableDropdown(
                        pressHandler: _updateGoal,
                        title: I18n.getText(context, 'textGoalForActivation'),
                        value: _goalSelected,
                        style: _personalPageStyle.dropDownStyle,
                        options: _goalOptions),
                    ReusableDropdown(
                        pressHandler: _updateMonthlyIncome,
                        title: I18n.getText(context, 'textMonthlyIncome'),
                        value: _monthlyIncomeSelected,
                        style: _personalPageStyle.dropDownStyle,
                        options: _monthlyIncomeOptions),
                    ReusableDropdown(
                        pressHandler: _updateMonthlyExpense,
                        title: I18n.getText(context, 'textMonthlyExpense'),
                        value: _monthlyExpenseSelected,
                        style: _personalPageStyle.dropDownStyle,
                        options: _monthlyExpenseOptions),
                    Expanded(
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: ReusableButton(
                              text: I18n.getText(context, 'textNext'),
                              style: _personalPageStyle.submitEmailButtonStyle,
                              pressHandler: () {
                                Navigator.push(
                                    context, schedulePageRoute(context));
                              },
                            )))
                  ]));
        });
  }

  void _mapState(BuildContext context, PersonalPageState state) {
    if (state is PersonalInfoLoaded) {
      _goalSelected = state.goal;
      _monthlyIncomeSelected = state.monthlyIncome;
      _monthlyExpenseSelected = state.monthlyExpanse;
    } else {
      _goalSelected = I18n.getText(context, 'textChooseoption');
      _monthlyIncomeSelected = I18n.getText(context, 'textChooseoption');
      _monthlyExpenseSelected = I18n.getText(context, 'textChooseoption');
    }
  }

  void _initOptions() {
    _goalOptions = ['Saving', 'Transaction'];
    _monthlyIncomeOptions = [
      '< Rp 1.000.000',
      'Rp 1.000.000 - Rp 5.000.000',
      '> 10.000.000'
    ];
    _monthlyExpenseOptions = [
      '< Rp 1.000.000',
      'Rp 1.000.000 - Rp 5.000.000',
      '> 10.000.000'
    ];
  }

  void _updateGoal(String value) {
    _personalPageBloc.add(UpdateValue(
        goalSelected: value,
        monthlyIncome: _monthlyIncomeSelected,
        monthlyExpense: _monthlyExpenseSelected));
  }

  void _updateMonthlyIncome(String value) {
    _personalPageBloc.add(UpdateValue(
        goalSelected: _goalSelected,
        monthlyIncome: value,
        monthlyExpense: _monthlyExpenseSelected));
  }

  void _updateMonthlyExpense(String value) {
    _personalPageBloc.add(UpdateValue(
        goalSelected: _goalSelected,
        monthlyIncome: _monthlyIncomeSelected,
        monthlyExpense: value));
  }
}
