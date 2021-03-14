abstract class SchedulePageEvent {}

class WelcomeInit extends SchedulePageEvent {}

class SubmitSchedule extends SchedulePageEvent {
  final String email;
  SubmitSchedule(this.email);
}

class UpdateValue extends SchedulePageEvent {
  final String date;
  final String time;
  UpdateValue({this.date, this.time});
}
