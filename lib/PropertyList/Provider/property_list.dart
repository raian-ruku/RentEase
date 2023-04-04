import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';
import 'package:rentease/PropertyList/Model/property_model.dart';

class PropertyList extends GetxController {
  static PropertyList get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  addVacancy(PropertyModel vacancy) {
    _db.collection("apartments").add(vacancy.toJson()).whenComplete(() =>
        Get.snackbar("Success", "Your apartment has been listed for sale",
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green,
            colorText: Colors.white));
  }

  catchError(error) {
    Get.snackbar("Error", "Something went wrong",
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(20),
        backgroundColor: Colors.red,
        colorText: Colors.white);

    return _db.collection("apartments").doc();
  }
}
