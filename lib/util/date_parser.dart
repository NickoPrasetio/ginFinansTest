import 'package:intl/intl.dart';

abstract class DateParser {
  static const String ddMMMyyyy = 'dd MMMM yyyy';
  static const String hhmm = 'HH:mm';

  static String parseDate(DateTime dateTime, String format,
      {String locale = 'id'}) {
    return DateFormat(format, locale).format(dateTime);
  }
}
