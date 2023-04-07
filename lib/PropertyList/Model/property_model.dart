import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

List<PropertyModel> propertyModelFromJson(String str) =>
    List<PropertyModel>.from(
        json.decode(str).map((x) => PropertyModel.fromJson(x)));

String propertyModelToJson(PropertyModel data) => json.encode(data.toJson());

class PropertyModel {
  PropertyModel({
    required this.description,
    required this.address,
    required this.rooms,
    required this.baths,
    required this.rent,
    required this.area,
    required this.category,
  });

  final String description;
  final String address;
  final String rooms;
  final String baths;
  final String rent;
  final String area;
  final String category;

  factory PropertyModel.fromJson(Map<String, dynamic> json) => PropertyModel(
        description: json["description"],
        address: json["address"],
        rooms: json["rooms"],
        baths: json["baths"],
        rent: json["rent"],
        area: json["area"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "address": address,
        "rooms": rooms,
        "baths": baths,
        "rent": rent,
        "area": area,
        "category": category,
      };

  factory PropertyModel.snapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return PropertyModel(
      description: data['description'],
      address: data['address'],
      rooms: data['rooms'],
      baths: data['baths'],
      rent: data['rent'],
      area: data['area'],
      category: data['category'],
    );
  }
}
