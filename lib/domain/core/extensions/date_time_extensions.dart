import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get dayMonthYearFormat => DateFormat('dd.M.yyyy').format(this);
}
