import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:rentease/HomePage/Pages/home_page.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/user_model.dart';
import '../Provider/user_repository.dart';
import 'dart:async';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late List<String> _userType;
  String? _selectUserType;
  GlobalKey<FormState> formKey = GlobalKey();
  final _picker = ImagePicker();
  File? imageFile;
  UserModel? user;
  UserRepository userRepository = UserRepository();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneNumController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordController2 = TextEditingController();

  String? imageurl;

  Future createAccount() async {
    try {
      /// upload task here
      final Reference storageRef = FirebaseStorage.instance
          .ref()
          .child('user_profile_images')
          .child('${DateTime.now().millisecondsSinceEpoch}.jpg');

      final TaskSnapshot uploadTask =
          await storageRef.putFile(File(imageFile!.path));
      final imageUrl = await uploadTask.ref.getDownloadURL();
      setState(() {});

      user = UserModel(
        name: _nameController.text,
        email: _emailController.text,
        phoneNumber: _phoneNumController.text,
        password: _passwordController.text,
        category: _selectUserType!,
        imageURL: imageUrl,
      );

      userRepository.createUser(context, user!);
    } catch (e) {
      Get.snackbar(
        'Error creating account',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<String?> pickImage() async {
    try {
      final imageFile = await _picker.pickImage(source: ImageSource.gallery);
      if (imageFile == null) return null;
      setState(() {});

      // Upload image to Firebase Storage
      // final Reference storageRef = FirebaseStorage.instance
      //     .ref()
      //     .child('user_profile_images')
      //     .child('${DateTime.now().millisecondsSinceEpoch}.jpg');

      // final TaskSnapshot uploadTask =
      //     await storageRef.putFile(File(imageFile.path));
      // final imageUrl = await uploadTask.ref.getDownloadURL();
    } on PlatformException catch (e) {
      Get.snackbar(
        'Failed to pick image: $e',
        "Try again",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return null;
    } catch (e) {
      Get.snackbar(
        'Error uploading image: $e',
        "Try again",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return null;
    }
  }

  @override
  void initState() {
    _userType = ['Owner', 'Tenant'];
    debugPrint(_userType.length.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const HomePage();
                },
              ),
            );
          },
          child: Image.asset(
            'images/RentEase-v1.png',
            fit: BoxFit.contain,
            height: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: ClipOval(
                      child: SizedBox(
                          height: 150,
                          width: 150,
                          child: imageFile != null
                              ? Image.file(imageFile!)
                              : const Center(child: Text("No Image Selected"))),
                    ),
                  ),
                  SizedBox(
                    child: TextFormField(
                      controller: _nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter name';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.686),
                            fontSize: 15),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(0, 0, 0, 0.686),
                                width: 2.0)),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter email';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.686), fontSize: 15),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(0, 0, 0, 0.686),
                              width: 2.0)),
                    ),
                  ),
                  TextFormField(
                    controller: _phoneNumController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter phone number';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.686), fontSize: 15),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(0, 0, 0, 0.686),
                              width: 2.0)),
                    ),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: "Enter atleast 6 characters",
                      labelStyle: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.686), fontSize: 15),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(0, 0, 0, 0.686),
                              width: 2.0)),
                    ),
                  ),
                  TextFormField(
                    controller: _passwordController2,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.686), fontSize: 15),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(0, 0, 0, 0.686),
                              width: 2.0)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.grey)),
                        onPressed: () {
                          pickImage();
                        },
                        child: const Text(
                          "Pick Image to Upload",
                          style: TextStyle(fontSize: 16),
                        )),
                  ),
                  Center(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade200),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 2),
                        child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                          value: _selectUserType,
                          hint: const Text('Select User Type'),
                          onChanged: (newValue) {
                            setState(() {
                              _selectUserType = newValue.toString();
                            });
                          },
                          items: _userType.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          if (_passwordController2.text !=
                              _passwordController.text) {
                            Get.snackbar(
                              "Error",
                              "Passwords do not match",
                              snackPosition: SnackPosition.BOTTOM,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 30),
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                            );
                          } else {
                            createAccount();
                          }
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(45, 207, 72, 0.69)),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
