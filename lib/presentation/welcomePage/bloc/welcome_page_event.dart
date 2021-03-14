abstract class WelcomePageEvent {}

class WelcomeInit extends WelcomePageEvent {}

class ChangeEmail extends WelcomePageEvent {
  final String email;
  ChangeEmail({this.email});
}

class ValidateEmail extends WelcomePageEvent {
  final String email;
  ValidateEmail(this.email);
}
