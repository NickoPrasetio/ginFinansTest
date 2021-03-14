abstract class WelcomePageEvent {}

class WelcomeInit extends WelcomePageEvent {}

class ChangeEmail extends WelcomePageEvent {
  final String email;
  ChangeEmail({this.email});
}

class SubmitEmail extends WelcomePageEvent {
  final String email;
  SubmitEmail(this.email);
}
