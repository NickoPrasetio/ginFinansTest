
abstract class PasswordPageEvent {}

class PasswordPageInit extends PasswordPageEvent {}

class ChangePasswordVisibility extends PasswordPageEvent {
  final bool isVisible;
  ChangePasswordVisibility(this.isVisible);
}

class ChangePasswordValue extends PasswordPageEvent {
  final String password;
  ChangePasswordValue(this.password);
}

