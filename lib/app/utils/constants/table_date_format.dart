import 'package:intl/intl.dart';

String tableDateFormat(dynamic createdAt) {
  DateTime parsedDate;

  if (createdAt is DateTime) {
    parsedDate = createdAt;
  } else if (createdAt is String) {
    parsedDate = DateTime.parse(createdAt);
  } else {
    return '';
  }

  DateFormat formatter = DateFormat("dd/MM/yyyy");
  return formatter.format(parsedDate);
}
