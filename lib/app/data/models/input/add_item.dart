class AddItem {
  int planningId;
  DateTime date;
  String information;
  int brutoAmount;
  int taxAmount;
  int nettoAmount;
  String category;
  dynamic? documentEvidence;
  dynamic? imageEvidence;
  int isAddition;

  AddItem({
    required this.planningId,
    required this.date,
    required this.information,
    required this.brutoAmount,
    required this.taxAmount,
    required this.nettoAmount,
    required this.category,
    this.documentEvidence,
    this.imageEvidence,
    required this.isAddition,
  });

  Map<String, dynamic> toJson() => {
        "planning_id": planningId,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "information": information,
        "bruto_amount": brutoAmount,
        "tax_amount": taxAmount,
        "netto_amount": nettoAmount,
        "category": category,
        "document_evidence": documentEvidence,
        "image_evidence": imageEvidence,
        "isAddition": isAddition,
      };
}
