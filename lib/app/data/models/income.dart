import 'dart:convert';

UserIncome incomeFromJson(String str) => UserIncome.fromJson(json.decode(str));

String incomeToJson(UserIncome data) => json.encode(data.toJson());

class UserIncome {
  bool? status;
  Data? data;

  UserIncome({
    this.status,
    this.data,
  });

  factory UserIncome.fromJson(Map<String, dynamic> json) => UserIncome(
        status:
            json["status"] ?? false, // menggunakan default value untuk boolean
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  int currentPage;
  List<Datum>? data;
  String firstPageUrl;
  int? from;
  int lastPage;
  String lastPageUrl;
  List<Link>? links;
  String? nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int? to;
  int total;

  Data({
    required this.currentPage, // menggunakan required untuk non-nullable
    this.data,
    required this.firstPageUrl,
    this.from,
    required this.lastPage,
    required this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    this.to,
    required this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"] ?? 0,
        data: json["data"] != null
            ? List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)))
            : null,
        firstPageUrl: json["first_page_url"] ?? '',
        from: json["from"],
        lastPage: json["last_page"] ?? 0,
        lastPageUrl: json["last_page_url"] ?? '',
        links: json["links"] != null
            ? List<Link>.from(json["links"].map((x) => Link.fromJson(x)))
            : null,
        nextPageUrl: json["next_page_url"],
        path: json["path"] ?? '',
        perPage: json["per_page"] ?? 0,
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"] ?? 0,
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
  int id;
  int userId;
  String activityName;
  String transactionType;
  int amount;
  int taxAmount;
  String? documentEvidence;
  String? imageEvidence;
  String status;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? date; // Mengubah type ke DateTime?

  Datum({
    required this.id,
    required this.userId,
    required this.activityName,
    required this.transactionType,
    required this.amount,
    required this.taxAmount,
    this.documentEvidence,
    this.imageEvidence,
    required this.status,
    this.createdAt,
    this.updatedAt,
    this.date, // Menginisialisasi date
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] ?? 0,
        userId: json["user_id"] ?? 0,
        activityName: json["activity_name"] ?? '',
        transactionType: json["transaction_type"] ?? '',
        amount: json["amount"] ?? 0,
        taxAmount: json["tax_amount"] ?? 0,
        documentEvidence: json["document_evidence"],
        imageEvidence: json["image_evidence"],
        status: json["status"] ?? '',
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : null,
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : null,
        date: json["date"] != null
            ? DateTime.parse(json["date"])
            : DateTime.now(), // Parsing date menjadi DateTime
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "activity_name": activityName,
        "transaction_type": transactionType,
        "amount": amount,
        "tax_amount": taxAmount,
        "document_evidence": documentEvidence,
        "image_evidence": imageEvidence,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "date":
            date?.toIso8601String(), // Menyerialisasi date ke string ISO 8601
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
        label: json["label"] ?? '',
        active: json["active"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
