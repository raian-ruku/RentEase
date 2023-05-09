import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:rentease/SignUp/Provider/user_repository.dart';

String name = '';
String email = '';
String phoneNum = '';

Future getUserInfo() async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User user = auth.currentUser!;
  final uid = user.uid;
  final DocumentSnapshot doc =
      await FirebaseFirestore.instance.collection("Users").doc(uid).get();
  name = doc['name'];
  email = doc['email'];
  phoneNum = doc['phoneNum'];

  print('name: $name');
}
