abstract class PersonalPageEvent {}

class WelcomeInit extends PersonalPageEvent {}

class UpdateValue extends PersonalPageEvent {
  final String goalSelected;
  final String monthlyIncome;
  final String monthlyExpense;
  UpdateValue({this.goalSelected, this.monthlyIncome, this.monthlyExpense});
}

class SubmitPersonalInfo extends PersonalPageEvent {
  final String email;
  SubmitPersonalInfo(this.email);
}
