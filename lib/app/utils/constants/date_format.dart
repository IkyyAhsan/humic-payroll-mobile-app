import 'package:intl/intl.dart';

String formatDate(dynamic createdAt) {
  DateTime parsedDate;

  try {
    if (createdAt is DateTime) {
      parsedDate = createdAt;
    } else if (createdAt is String) {
      if (createdAt.isEmpty) {
        return '';
      }
      parsedDate = DateTime.parse(createdAt);
    } else {
      return '';
    }

    // Format tanggal
    DateFormat formatter = DateFormat("dd/MM/yyyy", "id_ID");
    return formatter.format(parsedDate);
  } catch (e) {
    print('Error parsing date: $e');
    return '';
  }
}
