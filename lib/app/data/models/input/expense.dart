import 'dart:io';

class Expense {
  String name;
  DateTime date;
  int amount;
  int taxAmount;
  File? documentEvidence;
  File? imageEvidence;
  String? transactionType;

  Expense({
    required this.name,
    required this.date,
    required this.amount,
    required this.taxAmount,
    required this.documentEvidence,
    required this.imageEvidence,
    required this.transactionType,
  });
}
