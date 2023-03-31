import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rentease/SignUp/Model/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  createUser(UserModel user) async {
    try {
      await _db.collection("Users").add(user.toJson());
      Get.snackbar("Success", "Your Account has been created",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } catch (error) {
      Get.snackbar("Error", "Something went wrong",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      // Return a value that is assignable to DocumentReference<Map<String, dynamic>>
      return _db.collection("Users").doc();
    }
  }

  // createUser(UserModel user) async {
  //   await _db
  //       .collection("Users")
  //       .add(user.toJson())
  //       .whenComplete(
  //         () => Get.snackbar("Success", "Your Account has been created",
  //             snackPosition: SnackPosition.BOTTOM,
  //             backgroundColor: Colors.green,
  //             colorText: Colors.white),
  //       )
  //       .catchError((error) {
  //     Get.snackbar("Error", "Something went wrong",
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.red,
  //         colorText: Colors.white);
  //   });
  // }
}
