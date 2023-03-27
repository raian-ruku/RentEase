// To parse this JSON data, do
//
//     final UserModel = userDataFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.category,
  });

  final String? id;
  final String name;
  final String email;
  final String phoneNumber;
  final String password;
  final String category;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone number"],
        password: json["password"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone number": phoneNumber,
        "password": password,
        "category": category,
      };
}