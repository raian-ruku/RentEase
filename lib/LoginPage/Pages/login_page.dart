import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rentease/HomePage/Pages/home_page.dart';
import 'package:rentease/SignUp/Pages/sign_up.dart';
import 'package:rentease/OwnerUI/Pages/owner_landing.dart';

import '../../SignUp/Provider/user_repository.dart';
import 'forgot_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  signin() {
    if (formKey.currentState!.validate()) {
      UserRepository().signIn(_emailController.text, _passwordController.text);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _emailController.text = "raian@gmail.com";
    _passwordController.text = "123456";
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Image.asset(
                            "images/RentEase-v1.png",
                            fit: BoxFit.contain,
                            height: 100,
                            width: 400,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            ("Welcome to RentEase!"),
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.green.withOpacity(.8)),
                          ),
                        ),
                      ],
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
                              color: Color.fromRGBO(0, 0, 0, 0.686),
                              fontSize: 15),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(0, 0, 0, 0.686),
                                width: 2.0),
                          ))),
                  TextFormField(
                      obscureText: true,
                      controller: _passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.686),
                              fontSize: 15),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(0, 0, 0, 0.686),
                                width: 2.0),
                          ))),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          splashFactory: NoSplash.splashFactory),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                            return const ForgotUI();
                          }),
                        );
                      },
                      child: const Text("Forgot Password?",
                          style: TextStyle(
                              color: Color.fromRGBO(199, 71, 71, 0.69))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          signin();
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(45, 207, 72, 0.69),
                        ),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      const SizedBox(width: 50),
                      const Text(
                        "Don't Have An Account?",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            splashFactory: NoSplash.splashFactory),
                        child: const Text(
                          'Sign Up',
                          style:
                              TextStyle(color: Colors.lightBlue, fontSize: 17),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                              return const SignUp();
                            }),
                          );
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: 50),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
