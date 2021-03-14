abstract class PasswordPageState {}

class PasswordPageLoaded extends PasswordPageState {
  final bool isPasswordVisible;
  final bool isContainNumber;
  final bool isContainLowerCase;
  final bool isContainUppercase;
  final bool isConatainChar;
  PasswordPageLoaded(
      {this.isPasswordVisible,
      this.isContainNumber,
      this.isContainLowerCase,
      this.isContainUppercase,
      this.isConatainChar});
}
