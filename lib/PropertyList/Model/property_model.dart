import 'dart:convert';

List<PropertyModel> propertyModelFromJson(String str) =>
    List<PropertyModel>.from(
        json.decode(str).map((x) => PropertyModel.fromJson(x)));

String propertyModelToJson(List<PropertyModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PropertyModel {
  PropertyModel({
    required this.rent,
    required this.address,
    required this.category,
    required this.size,
    required this.details,
  });

  int rent;
  String address;
  String category;
  String size;
  String details;

  factory PropertyModel.fromJson(Map<String, dynamic> json) => PropertyModel(
        rent: json["rent"],
        address: json["address"],
        category: json["category"],
        size: json["size"],
        details: json["details"],
      );

  Map<String, dynamic> toJson() => {
        "rent": rent,
        "address": address,
        "category": category,
        "size": size,
        "details": details,
      };
}
