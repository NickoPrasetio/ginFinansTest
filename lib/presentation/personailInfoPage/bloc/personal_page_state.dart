
abstract class PersonalPageState {}

class InitLoaded extends PersonalPageState {
  final bool isButtonEnable;
  InitLoaded(this.isButtonEnable);
}

class PersonalInfoLoaded extends PersonalPageState {
  final String goal;
  final String monthlyIncome; 
  final String monthlyExpanse;
  PersonalInfoLoaded({this.goal, this.monthlyIncome, this.monthlyExpanse});
}

class EmailSubmited extends PersonalPageState {
  final String email;
  EmailSubmited(this.email);
}


