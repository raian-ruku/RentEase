import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    this.uid,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.category,
    this.imageURL,
  });

  String? uid;
  final String name;
  final String email;
  final String phoneNumber;
  final String password;
  final String category;
  String? imageURL;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json["uid"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        password: json["password"],
        category: json["category"],
        imageURL: json["image url"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password,
        "category": category,
        "image url": imageURL,
      };
}
