import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rentease/LoginPage/Pages/login_page.dart';
import 'package:rentease/OwnerUI/Pages/owner_landing.dart';
import 'package:rentease/SignUp/Model/user_model.dart';
import 'package:rentease/TenantUI/Pages/tenant_landing.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  var uid;

  createUser(BuildContext context, UserModel user) async {
    var d;
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      uid = userCredential.user!.uid;

      print("userCredential: ${userCredential.user!.uid}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('The password provided is too weak.',
            'Please enter a strong password',
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.all(20),
            backgroundColor: Colors.red,
            colorText: Colors.white);
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('The account already exists for that email.',
            'Please enter a different email',
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.all(20),
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    } catch (e) {
      print(e);
    }
    try {
      d = await _db.collection("Users").add(user.toJson());
      print('Signup UID: ${d.id}');

      ////
      final CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('Users');

      await usersCollection.doc(uid).set(user.toJson());

      print('d:${d.id}');
      if (d.id.isNotEmpty) {
        Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
      }

      Get.snackbar("Success", "Your Account has been created",
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } catch (error) {
      Get.snackbar("Error", "Something went wrong",
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(20),
          backgroundColor: Colors.red,
          colorText: Colors.white);

      return _db.collection("Users").doc();
    }
    await FirebaseAuth.instance.signOut();
  }

  signIn(String _email, String _pass) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _pass);
      print("Login userCredential: ${userCredential.user!.uid}");
      _db.collection('Users').doc(userCredential.user!.uid).get().then((value) {
        if (value.data()!['category'] == 'Tenant') {
          Get.off(() => const TenantUI());
        } else {
          Get.off(() => const OwnerUI());
        }
      });
      // Get.off(() => const OwnerUI());

      FirebaseAuth.instance.authStateChanges().listen((User? user) async {
        if (user != null) {
          String name = user.displayName ?? user.email ?? user.uid;

          Get.snackbar('Logged In', 'Successfully signed in as $name',
              snackPosition: SnackPosition.BOTTOM,
              margin: const EdgeInsets.all(20),
              backgroundColor: Colors.green,
              colorText: Colors.white);
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
            'No user found for that email.', 'Please enter correct email',
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.all(20),
            backgroundColor: Colors.red,
            colorText: Colors.white);
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Wrong password provided for that user.',
            'Please Enter correct password',
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.all(20),
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    }
  }
}
