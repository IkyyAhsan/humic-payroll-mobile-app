// To parse this JSON data, do
//
//     final planningCompare = planningCompareFromJson(jsonString);

import 'dart:convert';

PlanningCompare planningCompareFromJson(String str) => PlanningCompare.fromJson(json.decode(str));

String planningCompareToJson(PlanningCompare data) => json.encode(data.toJson());

class PlanningCompare {
    bool? status;
    Data? data;

    PlanningCompare({
        this.status,
        this.data,
    });

    factory PlanningCompare.fromJson(Map<String, dynamic> json) => PlanningCompare(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
    };
}

class Data {
    Planning? planning;
    Planning? realization;

    Data({
        this.planning,
        this.realization,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        planning: json["planning"] == null ? null : Planning.fromJson(json["planning"]),
        realization: json["realization"] == null ? null : Planning.fromJson(json["realization"]),
    );

    Map<String, dynamic> toJson() => {
        "planning": planning?.toJson(),
        "realization": realization?.toJson(),
    };
}

class Planning {
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

    Planning({
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

    factory Planning.fromJson(Map<String, dynamic> json) => Planning(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        itemCount: json["item_count"],
        itemSumBrutoAmount: json["item_sum_bruto_amount"],
        itemSumTaxAmount: json["item_sum_tax_amount"],
        itemSumNettoAmount: json["item_sum_netto_amount"],
        item: json["item"] == null ? [] : List<Item>.from(json["item"]!.map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date": "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "item_count": itemCount,
        "item_sum_bruto_amount": itemSumBrutoAmount,
        "item_sum_tax_amount": itemSumTaxAmount,
        "item_sum_netto_amount": itemSumNettoAmount,
        "item": item == null ? [] : List<dynamic>.from(item!.map((x) => x.toJson())),
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
        isAddition: json["isAddition"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "planning_id": planningId,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "information": information,
        "bruto_amount": brutoAmount,
        "tax_amount": taxAmount,
        "netto_amount": nettoAmount,
        "category": category,
        "isAddition": isAddition,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
