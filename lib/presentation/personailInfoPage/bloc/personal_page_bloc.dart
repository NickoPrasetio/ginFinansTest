import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ginFinans/presentation/personailInfoPage/bloc/personal_page_event.dart';
import 'package:ginFinans/presentation/personailInfoPage/bloc/personal_page_state.dart';

class PersonalPageBloc extends Bloc<PersonalPageEvent, PersonalPageState> {
  String _goalselected;
  String _monthlyIncomeSelected;
  String _monthlyExpense;
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
      yield updateUiStatus();
      return;
    }
  }

  PersonalInfoLoaded updateUiStatus() {
    return PersonalInfoLoaded(
        goal: _goalselected,
        monthlyIncome: _monthlyIncomeSelected,
        monthlyExpanse: _monthlyExpense);
  }
}
