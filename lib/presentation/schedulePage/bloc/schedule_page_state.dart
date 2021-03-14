abstract class SchedulePageState{}

class InitLoaded extends SchedulePageState {
  final bool isButtonEnable;
  InitLoaded(this.isButtonEnable);
}

class ScheduleLoaded extends SchedulePageState {
  final String date;
  final String time;

  ScheduleLoaded({this.date, this.time});
}

class ScheduleSubmited extends SchedulePageState {
  final String email;
  ScheduleSubmited(this.email);
}
