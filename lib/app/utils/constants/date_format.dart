import 'package:intl/intl.dart';

String formatDate(dynamic createdAt) {
  DateTime parsedDate;

  if (createdAt is DateTime) {
    parsedDate = createdAt;
  } else if (createdAt is String) {
    parsedDate = DateTime.parse(createdAt);
  } else {
    return ''; // Return empty string if createdAt is null or invalid
  }

  DateFormat formatter = DateFormat("dd/MM/yyyy", "id_ID");
  return formatter.format(parsedDate);
}
