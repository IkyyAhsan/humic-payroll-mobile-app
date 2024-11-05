class GetPlanning {
  int id;
  int planningId;
  DateTime date;
  String information;
  int brutoAmount;
  int taxAmount;
  int nettoAmount;
  String category;
  int isAddition;
  DateTime createdAt;
  DateTime updatedAt;

  GetPlanning({
    required this.id,
    required this.planningId,
    required this.date,
    required this.information,
    required this.brutoAmount,
    required this.taxAmount,
    required this.nettoAmount,
    required this.category,
    required this.isAddition,
    required this.createdAt,
    required this.updatedAt,
  });
}
