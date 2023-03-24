import 'package:flutter/material.dart';
import 'package:rentease/HomePage/Pages/home_page.dart';
import 'package:rentease/SignUp/Pages/sign_up.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 250),
                Container(
                  child: Center(
                    child: Column(
                      children: [
                        Image.asset(
                          "images/RentEase-v1.png",
                          fit: BoxFit.contain,
                          height: 30,
                          width: 150,
                        ),
                        const Text(
                          ("Welcome to RentEase!"),
                          style: TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                ),
                const TextField(
                    decoration: InputDecoration(
                        labelText: 'Username/Email',
                        labelStyle: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.686),
                            fontSize: 15),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(0, 0, 0, 0.686),
                              width: 2.0),
                        ))),
                const TextField(
                    decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.686),
                            fontSize: 15),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(0, 0, 0, 0.686),
                              width: 2.0),
                        ))),
                Row(
                  children: [
                    const SizedBox(width: 221),
                    TextButton(
                      style: TextButton.styleFrom(
                          splashFactory: NoSplash.splashFactory),
                      onPressed: () {},
                      child: const Text("Forgot Password?",
                          style: TextStyle(color: Color.fromRGBO(0, 0, 0, 80))),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
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
                        style: TextStyle(color: Colors.black, fontSize: 17),
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
    );
  }
}
