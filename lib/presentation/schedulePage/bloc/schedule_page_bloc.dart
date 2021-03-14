import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ginFinans/presentation/schedulePage/bloc/schedule_page_event.dart';
import 'package:ginFinans/presentation/schedulePage/bloc/schedule_page_state.dart';
import 'package:ginFinans/util/constants.dart';

class SchedulePageBloc extends Bloc<SchedulePageEvent, SchedulePageState> {
  SchedulePageBloc() : super(InitLoaded(false));
  String _selectedDate, _selectedTime;
  bool _isValidSchedule;

  @override
  Stream<SchedulePageState> mapEventToState(SchedulePageEvent event) async* {
    if (event is WelcomeInit) {
      yield InitLoaded(false);
    } else if (event is UpdateValue) {
      _selectedDate = event.date;
      _selectedTime = event.time;
      _isValidSchedule = checkValidSchedule();
      yield updateUiStatus();
    }
  }

  bool checkValidSchedule() {
    if (_selectedDate != Constants.defaultOptionValue &&
        _selectedTime != Constants.defaultOptionValue) {
      return true;
    } else {
      return false;
    }
  }

  ScheduleLoaded updateUiStatus() {
    return ScheduleLoaded(
        isValidSchedule: _isValidSchedule,
        date: _selectedDate,
        time: _selectedTime);
  }
}
