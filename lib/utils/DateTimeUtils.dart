import 'package:intl/intl.dart' show DateFormat;

class DateTimeUtils {
  static String dateString(DateTime datetime) {
    return DateFormat('dd-MM-yyyy').format(datetime);
  }

  static DateTime parseDateString(String txt) {
    return DateFormat('dd-MM-yyyy').parse(txt);
  }
}