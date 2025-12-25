import 'package:intl/intl.dart';

String formatArticleDate(String? date) {
  if (date == null || date.isEmpty) return '';

  final dateTime = DateTime.parse(date);
  return DateFormat('EEEE , d MMM yyyy').format(dateTime);
}
