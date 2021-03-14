abstract class PasswordPageState {}

class PasswordPageLoaded extends PasswordPageState {
  final bool isPasswordVisible;
  PasswordPageLoaded({this.isPasswordVisible});
}

