class RegexPattern {
  static const regexEmail =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const regexNumber = '[0-9]';
  static const regexLowerCase = r'^(?=.*?[a-z])';
  static const regexUpperCase = r'^(?=.*?[A-Z])';
  static const regexSpecialChar = r'^(?=.*?[!@#\$&*~£])';
}
