import 'dart:convert';

Approve approveFromJson(String str) => Approve.fromJson(json.decode(str));

String approveToJson(Approve data) => json.encode(data.toJson());

class Approve {
  bool? status;
  Data? data;

  Approve({
    this.status,
    this.data,
  });

  factory Approve.fromJson(Map<String, dynamic> json) => Approve(
        status: json["status"],
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  int? currentPage;
  List<Datum>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Data({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: json["data"] != null
            ? List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)))
            : null,
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] != null
            ? List<Link>.from(json["links"].map((x) => Link.fromJson(x)))
            : null,
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data != null
            ? List<dynamic>.from(data!.map((x) => x.toJson()))
            : null,
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": links != null
            ? List<dynamic>.from(links!.map((x) => x.toJson()))
            : null,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
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

  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
        date: json["date"] != null ? DateTime.parse(json["date"]) : null,
        information: json["information"],
        brutoAmount: json["bruto_amount"],
        taxAmount: json["tax_amount"],
        nettoAmount: json["netto_amount"],
        category: json["category"],
        isAddition: json["isAddition"],
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : null,
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "planning_id": planningId,
        "date": date?.toIso8601String(),
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

class Link {
  String? url;
  String label;
  bool active;

  Link({
    this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
