abstract class WelcomePageState {}
class InitLoaded extends WelcomePageState {
  final bool isButtonEnable;
  InitLoaded(this.isButtonEnable);
}

class EmailChanged extends WelcomePageState {
  final String email;
  final bool isValid;
  EmailChanged({this.email, this.isValid});
}

class EmailSubmited extends WelcomePageState {
  final String email;
  EmailSubmited(this.email);
}
