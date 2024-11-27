import 'dart:convert';

ShowRealization showRealizationFromJson(String str) =>
    ShowRealization.fromJson(json.decode(str));

String showRealizationToJson(ShowRealization data) =>
    json.encode(data.toJson());

class ShowRealization {
  bool? status;
  Data? data;

  ShowRealization({
    this.status,
    this.data,
  });

  factory ShowRealization.fromJson(Map<String, dynamic> json) =>
      ShowRealization(
        status: json["status"],
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  int? id;
  int? userId;
  String? title;
  DateTime? startDate;
  DateTime? endDate;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? itemCount;
  String? itemSumBrutoAmount;
  String? itemSumTaxAmount;
  String? itemSumNettoAmount;
  List<Item>? item;

  Data({
    this.id,
    this.userId,
    this.title,
    this.startDate,
    this.endDate,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.itemCount,
    this.itemSumBrutoAmount,
    this.itemSumTaxAmount,
    this.itemSumNettoAmount,
    this.item,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        startDate: json["start_date"] != null
            ? DateTime.parse(json["start_date"])
            : null,
        endDate:
            json["end_date"] != null ? DateTime.parse(json["end_date"]) : null,
        status: json["status"],
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : null,
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : null,
        itemCount: json["item_count"],
        itemSumBrutoAmount: json["item_sum_bruto_amount"],
        itemSumTaxAmount: json["item_sum_tax_amount"],
        itemSumNettoAmount: json["item_sum_netto_amount"],
        item: json["item"] != null
            ? List<Item>.from(json["item"].map((x) => Item.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "start_date": startDate?.toIso8601String(),
        "end_date": endDate?.toIso8601String(),
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "item_count": itemCount,
        "item_sum_bruto_amount": itemSumBrutoAmount,
        "item_sum_tax_amount": itemSumTaxAmount,
        "item_sum_netto_amount": itemSumNettoAmount,
        "item": item != null
            ? List<dynamic>.from(item!.map((x) => x.toJson()))
            : null,
      };
}

class Item {
  int? id;
  int? planningId;
  DateTime? date;
  String? information;
  int? brutoAmount;
  int? taxAmount;
  int? nettoAmount;
  String? category;
  String? documentEvidence;
  String? imageEvidence;
  int? isAddition;
  DateTime? createdAt;
  DateTime? updatedAt;

  Item({
    this.id,
    this.planningId,
    this.date,
    this.information,
    this.brutoAmount,
    this.taxAmount,
    this.nettoAmount,
    this.category,
    this.documentEvidence,
    this.imageEvidence,
    this.isAddition,
    this.createdAt,
    this.updatedAt,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        planningId: json["planning_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        information: json["information"],
        brutoAmount: json["bruto_amount"],
        taxAmount: json["tax_amount"],
        nettoAmount: json["netto_amount"],
        category: json["category"],
        documentEvidence: json["document_evidence"],
        imageEvidence: json["image_evidence"],
        isAddition: json["isAddition"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "planning_id": planningId,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "information": information,
        "bruto_amount": brutoAmount,
        "tax_amount": taxAmount,
        "netto_amount": nettoAmount,
        "category": category,
        "document_evidence": documentEvidence,
        "image_evidence": imageEvidence,
        "isAddition": isAddition,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
