import 'package:intl/intl.dart';

String formatDateYearMonthDate(DateTime date) =>
    DateFormat('dd/MM/yy').format(date);
