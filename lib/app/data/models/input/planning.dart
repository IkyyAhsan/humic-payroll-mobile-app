// To parse this JSON data, do
//
//     final planningDetail = planningDetailFromJson(jsonString);

import 'dart:convert';

PlanningDetail planningDetailFromJson(String str) => PlanningDetail.fromJson(json.decode(str));

String planningDetailToJson(PlanningDetail data) => json.encode(data.toJson());

class PlanningDetail {
    int id;
    int userId;
    String title;
    DateTime startDate;
    DateTime endDate;
    String status;
    DateTime createdAt;
    DateTime updatedAt;

    PlanningDetail({
        required this.id,
        required this.userId,
        required this.title,
        required this.startDate,
        required this.endDate,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    factory PlanningDetail.fromJson(Map<String, dynamic> json) => PlanningDetail(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
