abstract class PasswordPageState {}

class PasswordPageLoaded extends PasswordPageState {
  final String passwordLevel;
  final bool isPasswordVisible;
  final bool isContainNumber;
  final bool isContainLowerCase;
  final bool isContainUppercase;
  final bool isConatainChar;
  final bool isValidPassword;
  PasswordPageLoaded(
      {this.passwordLevel,
      this.isPasswordVisible,
      this.isContainNumber,
      this.isContainLowerCase,
      this.isContainUppercase,
      this.isConatainChar,
      this.isValidPassword});
}
