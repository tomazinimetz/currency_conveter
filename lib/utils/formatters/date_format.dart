import 'package:intl/intl.dart';

class DateFormatUtils {
  static String toBrazilianStringFormat(DateTime date) {
    if (date == null) return "";
    return DateFormat('dd-MM-yyy hh:mm:ss').format(date);
  }

  static DateTime toBrazilianDateTimeFormat(DateTime date) {
    if (date == null) return DateTime.now();
    return DateTime.utc(date.year, date.month, date.day, date.hour + 9,
        date.minute, date.second);
  }
}
