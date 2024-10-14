
import 'dart:convert';

Dashboard dashboardFromJson(String str) => Dashboard.fromJson(json.decode(str));

String dashboardToJson(Dashboard data) => json.encode(data.toJson());

class Dashboard {
    bool status;
    Data data;

    Dashboard({
        required this.status,
        required this.data,
    });

    factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
    };
}

class Data {
    int ballance;
    int monthlyIncome;
    int monthlyExpense;
    TransactionList transactionList;

    Data({
        required this.ballance,
        required this.monthlyIncome,
        required this.monthlyExpense,
        required this.transactionList,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        ballance: json["ballance"],
        monthlyIncome: json["monthlyIncome"],
        monthlyExpense: json["monthlyExpense"],
        transactionList: TransactionList.fromJson(json["transactionList"]),
    );

    Map<String, dynamic> toJson() => {
        "ballance": ballance,
        "monthlyIncome": monthlyIncome,
        "monthlyExpense": monthlyExpense,
        "transactionList": transactionList.toJson(),
    };
}

class TransactionList {
    int currentPage;
    List<Datum> data;
    String firstPageUrl;
    int from;
    int lastPage;
    String lastPageUrl;
    List<Link> links;
    String nextPageUrl;
    String path;
    int perPage;
    dynamic prevPageUrl;
    int to;
    int total;

    TransactionList({
        required this.currentPage,
        required this.data,
        required this.firstPageUrl,
        required this.from,
        required this.lastPage,
        required this.lastPageUrl,
        required this.links,
        required this.nextPageUrl,
        required this.path,
        required this.perPage,
        required this.prevPageUrl,
        required this.to,
        required this.total,
    });

    factory TransactionList.fromJson(Map<String, dynamic> json) => TransactionList(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
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
    String documentEvidence;
    String imageEvidence;
    String status;
    DateTime createdAt;
    DateTime updatedAt;

    Datum({
        required this.id,
        required this.userId,
        required this.activityName,
        required this.transactionType,
        required this.amount,
        required this.taxAmount,
        required this.documentEvidence,
        required this.imageEvidence,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
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
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class Link {
    String? url;
    String label;
    bool active;

    Link({
        required this.url,
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
