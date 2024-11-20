import 'package:intl/intl.dart';

String formatYear(dynamic createdAt) {
  DateTime parsedDate;

  if (createdAt is DateTime) {
    parsedDate = createdAt;
  } else if (createdAt is String) {
    try {
      parsedDate = DateTime.parse(createdAt);
    } catch (e) {
      return '';
    }
  } else {
    return '';
  }

  DateFormat formatter = DateFormat("yyyy");
  return formatter.format(parsedDate);
}
