import 'package:flutter/material.dart';
import 'package:rentease/HomePage/Pages/home_page.dart';
import 'vacancies.dart';
import 'package:rentease/OwnerUI/Constants/custom_drawer.dart';

class OwnerUI extends StatefulWidget {
  const OwnerUI({super.key});

  @override
  State<OwnerUI> createState() => _OwnerUIState();
}

class _OwnerUIState extends State<OwnerUI> {
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
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: const CustomDrawer(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 110),
                child: Column(
                  children: const [
                    Placeholder(
                      fallbackHeight: 200,
                      //owner image goes here
                    ),
                    SizedBox(height: 10),
                    Placeholder(
                        fallbackHeight: 30,
                        child: Text(
                          "owner name",
                          style: TextStyle(
                              fontSize: 25, fontStyle: FontStyle.italic),
                        )),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 40),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: GestureDetector(
                        onTap: () {},
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.person,
                                  size: 30,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Tenants List",
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.message,
                                  size: 30,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Chat",
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
