import 'package:flutter/material.dart';
import 'package:rentease/HomePage/Pages/home_page.dart';

class OwnerUI extends StatefulWidget {
  const OwnerUI({super.key});

  @override
  State<OwnerUI> createState() => _OwnerUIState();
}

class _OwnerUIState extends State<OwnerUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
