import 'package:rentease/HomePage/Pages/home_page.dart';

import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late List<String> _userType;
  String _selectUserType = 'Select User Type';
  @override
  void initState() {
    // TODO: implement initState
    _userType = ['Owner', 'Tenant'];
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
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //const SizedBox(height: 250),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.686), fontSize: 15),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(0, 0, 0, 0.686), width: 2.0)),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.686), fontSize: 15),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(0, 0, 0, 0.686), width: 2.0)),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.686), fontSize: 15),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(0, 0, 0, 0.686), width: 2.0)),
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.686), fontSize: 15),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(0, 0, 0, 0.686), width: 2.0)),
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                    labelStyle: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.686), fontSize: 15),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(0, 0, 0, 0.686), width: 2.0)),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                    hint: const Text('Select User Type'),
                    onChanged: (value) {
                      print(value.toString());
                      setState(() {
                        _selectUserType = value.toString();
                      });
                    },
                    value: _selectUserType,
                    items: _userType
                        .map<DropdownMenuItem<String>>(
                            (e) => DropdownMenuItem(child: Text(e)))
                        .toList(),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
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
    );
  }
}
