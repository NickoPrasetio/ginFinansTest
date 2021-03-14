import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ginFinans/presentation/personailInfoPage/bloc/personal_page_event.dart';
import 'package:ginFinans/presentation/personailInfoPage/bloc/personal_page_state.dart';
import 'package:ginFinans/util/constants.dart';

class PersonalPageBloc extends Bloc<PersonalPageEvent, PersonalPageState> {
  String _goalselected, _monthlyIncomeSelected, _monthlyExpense;
  bool _isvalidData;
  PersonalPageBloc() : super(InitLoaded(false));

  @override
  Stream<PersonalPageState> mapEventToState(PersonalPageEvent event) async* {
    if (event is WelcomeInit) {
      yield InitLoaded(false);
      return;
    } else if (event is UpdateValue) {
      _goalselected = event.goalSelected;
      _monthlyIncomeSelected = event.monthlyIncome;
      _monthlyExpense = event.monthlyExpense;
      _isvalidData = checkValidData();
      yield updateUiStatus();
      return;
    }
  }

  bool checkValidData() {
    if (_goalselected != Constants.defaultOptionValue &&
        _monthlyIncomeSelected != Constants.defaultOptionValue &&
        _monthlyExpense != Constants.defaultOptionValue) {
      return true;
    } else {
      return false;
    }
  }

  PersonalInfoLoaded updateUiStatus() {
    return PersonalInfoLoaded(
        goal: _goalselected,
        monthlyIncome: _monthlyIncomeSelected,
        monthlyExpanse: _monthlyExpense,
        isValidData: _isvalidData);
  }
}
