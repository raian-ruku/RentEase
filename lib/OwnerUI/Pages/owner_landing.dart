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
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
              ),
              child: const Center(
                child: Text(
                  'Management Menu',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
            ListTile(
              splashColor: Colors.green.shade300,
              title: const Text(
                'Home',
                style: TextStyle(fontSize: 17),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              splashColor: Colors.green.shade300,
              title: const Text(
                'Vacancies',
                style: TextStyle(fontSize: 17),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
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
