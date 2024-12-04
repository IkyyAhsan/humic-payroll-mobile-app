// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);

import 'dart:convert';

UserProfile userProfileFromJson(String str) =>
    UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
  int id;
  String? name;
  String? email;
  String role;
  DateTime? createdAt;
  DateTime updatedAt;
  String? image;

  UserProfile({
    required this.id,
    this.name,
    this.email,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    this.image,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        role: json["role"],
        createdAt: json["createdAt"] != null
            ? DateTime.parse(json["createdAt"])
            : null,
        updatedAt: DateTime.parse(json["updated_at"]),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "role": role,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "image": image,
      };
}
