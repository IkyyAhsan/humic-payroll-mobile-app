// To parse this JSON data, do
//
//     final dashboard = dashboardFromJson(jsonString);

import 'dart:convert';

Dashboard dashboardFromJson(String str) => Dashboard.fromJson(json.decode(str));

String dashboardToJson(Dashboard data) => json.encode(data.toJson());

class Dashboard {
  bool? status;
  Data? data;

  Dashboard({
    this.status,
    this.data,
  });

  factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  int? balance;
  int? monthlyIncome;
  int? monthlyExpense;
  List<MonthlyIncomeExpenseDatum>? monthlyIncomeExpenseData;
  Approval? approval;
  PieChart? pieChart;
  TransactionList? transactionList;

  Data({
    this.balance,
    this.monthlyIncome,
    this.monthlyExpense,
    this.monthlyIncomeExpenseData,
    this.approval,
    this.pieChart,
    this.transactionList,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        balance: json["balance"],
        monthlyIncome: json["monthlyIncome"],
        monthlyExpense: json["monthlyExpense"],
        monthlyIncomeExpenseData: json["monthlyIncomeExpenseData"] == null
            ? []
            : List<MonthlyIncomeExpenseDatum>.from(
                json["monthlyIncomeExpenseData"]!
                    .map((x) => MonthlyIncomeExpenseDatum.fromJson(x))),
        approval: json["approval"] == null
            ? null
            : Approval.fromJson(json["approval"]),
        pieChart: json["pieChart"] == null
            ? null
            : PieChart.fromJson(json["pieChart"]),
        transactionList: json["transactionList"] == null
            ? null
            : TransactionList.fromJson(json["transactionList"]),
      );

  Map<String, dynamic> toJson() => {
        "balance": balance,
        "monthlyIncome": monthlyIncome,
        "monthlyExpense": monthlyExpense,
        "monthlyIncomeExpenseData": monthlyIncomeExpenseData == null
            ? []
            : List<dynamic>.from(
                monthlyIncomeExpenseData!.map((x) => x.toJson())),
        "approval": approval?.toJson(),
        "pieChart": pieChart?.toJson(),
        "transactionList": transactionList?.toJson(),
      };
}

class Approval {
  List<Transaction>? transaction;
  List<Planning>? planning;

  Approval({
    this.transaction,
    this.planning,
  });

  factory Approval.fromJson(Map<String, dynamic> json) => Approval(
        transaction: json["transaction"] == null
            ? []
            : List<Transaction>.from(
                json["transaction"]!.map((x) => Transaction.fromJson(x))),
        planning: json["planning"] == null
            ? []
            : List<Planning>.from(
                json["planning"]!.map((x) => Planning.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "transaction": transaction == null
            ? []
            : List<dynamic>.from(transaction!.map((x) => x.toJson())),
        "planning": planning == null
            ? []
            : List<dynamic>.from(planning!.map((x) => x.toJson())),
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
  });

  factory Planning.fromJson(Map<String, dynamic> json) => Planning(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        itemCount: json["item_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "item_count": itemCount,
      };
}

class Transaction {
  int? id;
  int? userId;
  String? activityName;
  String? transactionType;
  DateTime? date;
  int? amount;
  int? taxAmount;
  String? documentEvidence;
  String? imageEvidence;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Transaction({
    this.id,
    this.userId,
    this.activityName,
    this.transactionType,
    this.date,
    this.amount,
    this.taxAmount,
    this.documentEvidence,
    this.imageEvidence,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        userId: json["user_id"],
        activityName: json["activity_name"],
        transactionType: json["transaction_type"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        amount: json["amount"],
        taxAmount: json["tax_amount"],
        documentEvidence: json["document_evidence"],
        imageEvidence: json["image_evidence"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "activity_name": activityName,
        "transaction_type": transactionType,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "amount": amount,
        "tax_amount": taxAmount,
        "document_evidence": documentEvidence,
        "image_evidence": imageEvidence,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class MonthlyIncomeExpenseDatum {
  String? name;
  int? income;
  int? expense;

  MonthlyIncomeExpenseDatum({
    this.name,
    this.income,
    this.expense,
  });

  factory MonthlyIncomeExpenseDatum.fromJson(Map<String, dynamic> json) =>
      MonthlyIncomeExpenseDatum(
        name: json["name"],
        income: json["income"],
        expense: json["expense"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "income": income,
        "expense": expense,
      };
}

class PieChart {
  int? totalPlanning;
  List<Datum>? planningData;
  int? totalRealization;
  List<Datum>? realizationData;

  PieChart({
    this.totalPlanning,
    this.planningData,
    this.totalRealization,
    this.realizationData,
  });

  factory PieChart.fromJson(Map<String, dynamic> json) => PieChart(
        totalPlanning: json["totalPlanning"],
        planningData: json["planningData"] == null
            ? []
            : List<Datum>.from(
                json["planningData"]!.map((x) => Datum.fromJson(x))),
        totalRealization: json["totalRealization"],
        realizationData: json["realizationData"] == null
            ? []
            : List<Datum>.from(
                json["realizationData"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalPlanning": totalPlanning,
        "planningData": planningData == null
            ? []
            : List<dynamic>.from(planningData!.map((x) => x.toJson())),
        "totalRealization": totalRealization,
        "realizationData": realizationData == null
            ? []
            : List<dynamic>.from(realizationData!.map((x) => x.toJson())),
      };
}

class Datum {
  String? name;
  int? value;

  Datum({
    this.name,
    this.value,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}

class TransactionList {
  int? currentPage;
  List<Transaction>? data;
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

  TransactionList({
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

  factory TransactionList.fromJson(Map<String, dynamic> json) =>
      TransactionList(
        currentPage: json["current_page"],
        data: json["data"] == null
            ? []
            : List<Transaction>.from(
                json["data"]!.map((x) => Transaction.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": links == null
            ? []
            : List<dynamic>.from(links!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
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
