import 'package:flutter/material.dart';
import 'package:rentease/PropertyList/Provider/get_property_list.dart';
import 'package:rentease/LoginPage/Pages/login_page.dart';
import 'package:rentease/PropertyList/Model/property_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: GestureDetector(
          onTap: () {
            debugPrint('Logo Button Pressed');
          },
          child: Image.asset(
            'images/RentEase-v1.png',
            fit: BoxFit.contain,
            height: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return const LoginPage();
                }),
              );
            },
            icon: const Icon(Icons.person_rounded),
            color: Colors.black,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 1,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'All Properties',
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                              style: TextButton.styleFrom(
                                  splashFactory: NoSplash.splashFactory),
                              onPressed: () {},
                              child: const Text(
                                'View All',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: FutureBuilder<List<PropertyModel>>(
                            future: PropertyList.instance.propertyData(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final propertyList = snapshot.data!;
                                return Row(
                                  children: propertyList
                                      .map((e) => SizedBox(
                                            child: Card(
                                              elevation: 10,
                                              child: Column(
                                                children: [
                                                  Text(
                                                    '৳${e.rent}',
                                                    style: const TextStyle(
                                                        fontSize: 25),
                                                  ),
                                                  Text(
                                                    e.description,
                                                    style: const TextStyle(
                                                        fontSize: 18),
                                                  ),
                                                  Text(
                                                    e.area,
                                                    style: const TextStyle(
                                                        fontSize: 18),
                                                  ),
                                                  Text(
                                                    e.address,
                                                    style: const TextStyle(
                                                        fontSize: 22),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                );
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                return const CircularProgressIndicator();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
