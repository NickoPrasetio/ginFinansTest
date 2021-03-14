import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ginFinans/presentation/passwordPage/bloc/password_page_event.dart';
import 'package:ginFinans/presentation/passwordPage/bloc/password_pahe_state.dart';
import 'package:ginFinans/util/regex_pattern.dart';

class PasswordPageBloc extends Bloc<PasswordPageEvent, PasswordPageState> {
  PasswordPageBloc()
      : super(PasswordPageLoaded(
          passwordLevel: '',
          isPasswordVisible: false,
          isConatainChar: false,
          isContainNumber: false,
          isContainLowerCase: false,
          isContainUppercase: false,
        ));

  bool _isPasswordVisible,
      _containNumber,
      _containLowerCase,
      _containUpperCase,
      _containChar;
  int _counterPass;

  @override
  Stream<PasswordPageState> mapEventToState(PasswordPageEvent event) async* {
    _counterPass = 0;
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

  String calcPassWeakness() {
    if (_counterPass < 2) {
      return 'Super Weak';
    } else if (_counterPass <= 3) {
      return 'Weak';
    } else if (_counterPass >= 4) {
      return 'Strong';
    }
    return '';
  }

  bool isContainNumber(String value) {
    final bool isTrue = RegExp(RegexPattern.regexNumber).hasMatch(value);
    if (isTrue) {
      _counterPass += 1;
    }
    return isTrue;
  }

  bool isContainLowerCase(String value) {
    final bool isTrue = RegExp(RegexPattern.regexLowerCase).hasMatch(value);
    if (isTrue) {
      _counterPass += 1;
    }
    return isTrue;
  }

  bool isContainUpperCase(String value) {
    final bool isTrue = RegExp(RegexPattern.regexUpperCase).hasMatch(value);
    if (isTrue) {
      _counterPass += 1;
    }
    return isTrue;
  }

  bool isContainChar(String value) {
    final bool isTrue = RegExp(RegexPattern.regexSpecialChar).hasMatch(value);
    if (isTrue) {
      _counterPass += 1;
    }
    return isTrue;
  }

  PasswordPageLoaded updateUiStatus() {
    return PasswordPageLoaded(
        passwordLevel: calcPassWeakness(),
        isPasswordVisible: _isPasswordVisible,
        isConatainChar: _containChar,
        isContainNumber: _containNumber,
        isContainLowerCase: _containLowerCase,
        isContainUppercase: _containUpperCase);
  }
}
