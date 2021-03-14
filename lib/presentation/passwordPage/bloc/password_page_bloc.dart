import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ginFinans/presentation/passwordPage/bloc/password_page_event.dart';
import 'package:ginFinans/presentation/passwordPage/bloc/password_pahe_state.dart';
import 'package:ginFinans/util/regex_pattern.dart';

class PasswordPageBloc extends Bloc<PasswordPageEvent, PasswordPageState> {
  PasswordPageBloc()
      : super(PasswordPageLoaded(
            isPasswordVisible: false,
            isConatainChar: false,
            isContainNumber: false,
            isContainLowerCase: false,
            isContainUppercase: false));

  bool _isPasswordVisible,
      _containNumber,
      _containLowerCase,
      _containUpperCase,
      _containChar;

  @override
  Stream<PasswordPageState> mapEventToState(PasswordPageEvent event) async* {
    if (event is PasswordPageInit) {
      _isPasswordVisible = false;
      _containNumber = false;
      _containLowerCase = false;
      _containUpperCase = false;
      _containChar = false;
    } else if (event is ChangePasswordVisibility) {
      _isPasswordVisible = !event.isVisible;
    } else if (event is ChangePasswordValue) {
      _containNumber = isContainNumber(event.password);
      _containLowerCase = isContainLowerCase(event.password);
      _containUpperCase = isContainUpperCase(event.password);
      _containChar = isContainChar(event.password);
    }
    yield updateUiStatus();
  }

  bool isContainNumber(String value) {
    return RegExp(RegexPattern.regexNumber).hasMatch(value);
  }

  bool isContainLowerCase(String value) {
    return RegExp(RegexPattern.regexLowerCase).hasMatch(value);
  }

  bool isContainUpperCase(String value) {
    return RegExp(RegexPattern.regexUpperCase).hasMatch(value);
  }

  bool isContainChar(String value) {
    return RegExp(RegexPattern.regexSpecialChar).hasMatch(value);
  }

  PasswordPageLoaded updateUiStatus() {
    return PasswordPageLoaded(
        isPasswordVisible: _isPasswordVisible,
        isConatainChar: _containChar,
        isContainNumber: _containNumber,
        isContainLowerCase: _containLowerCase,
        isContainUppercase: _containUpperCase);
  }
}
