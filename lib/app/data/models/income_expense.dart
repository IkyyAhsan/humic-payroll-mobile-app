import 'dart:convert';

IncomeExpense incomeExpenseFromJson(String str) => IncomeExpense.fromJson(json.decode(str));

String incomeExpenseToJson(IncomeExpense data) => json.encode(data.toJson());

class IncomeExpense {
    bool? status;
    Data? data;

    IncomeExpense({
        this.status,
        this.data,
    });

    factory IncomeExpense.fromJson(Map<String, dynamic> json) => IncomeExpense(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
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
    String? nextPageUrl;
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
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null
            ? null
            : List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": links == null ? null : List<dynamic>.from(links!.map((x) => x.toJson())),
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
    String? activityName;
    String? transactionType;
    int? amount;
    int? taxAmount;
    String? documentEvidence;
    String? imageEvidence;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;

    Datum({
        this.id,
        this.userId,
        this.activityName,
        this.transactionType,
        this.amount,
        this.taxAmount,
        this.documentEvidence,
        this.imageEvidence,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        activityName: json["activity_name"],
        transactionType: json["transaction_type"],
        amount: json["amount"],
        taxAmount: json["tax_amount"],
        documentEvidence: json["document_evidence"],
        imageEvidence: json["image_evidence"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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
    };
}

class Link {
    String? url;
    String? label;
    bool? active;

    Link({
        this.url,
        this.label,
        this.active,
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
