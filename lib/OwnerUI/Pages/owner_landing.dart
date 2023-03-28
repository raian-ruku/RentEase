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
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 110),
                child: Column(
                  children: const [
                    Icon(
                      Icons.person,
                      size: 150,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Welcome, Owner!",
                      style:
                          TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                child: SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width * .3,
                    child: GestureDetector(
                      onTap: () {},
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            children: const [
                              Icon(
                                Icons.person,
                                size: 24,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Tenants List",
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
