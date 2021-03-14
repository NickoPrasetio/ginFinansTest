import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ginFinans/presentation/schedulePage/bloc/schedule_page_event.dart';
import 'package:ginFinans/presentation/schedulePage/bloc/schedule_page_state.dart';

class SchedulePageBloc extends Bloc<SchedulePageEvent, SchedulePageState> {
  SchedulePageBloc() : super(InitLoaded(false));
  String _selectedDate, _selectedTime;

  @override
  Stream<SchedulePageState> mapEventToState(SchedulePageEvent event) async* {
    if (event is WelcomeInit) {
      yield InitLoaded(false);
    } else if (event is UpdateValue) {
      _selectedDate = event.date;
      _selectedTime = event.time;
      yield updateUiStatus();
    }
  }

  ScheduleLoaded updateUiStatus() {
    return ScheduleLoaded(date: _selectedDate, time: _selectedTime);
  }
}
