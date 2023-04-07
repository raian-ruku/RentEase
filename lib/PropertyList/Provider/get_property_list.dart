import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';
import 'package:rentease/PropertyList/Model/property_model.dart';

class PropertyList extends GetxController {
  static PropertyList get instance => Get.put(PropertyList());
  final _db = FirebaseFirestore.instance;

  Future<List<PropertyModel>> propertyData() async {
    final snapshot = await _db.collection("apartments").get();
    final propertydata =
        snapshot.docs.map((doc) => PropertyModel.fromJson(doc.data())).toList();
    return propertydata;
  }
}
