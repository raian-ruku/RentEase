import 'package:flutter/material.dart';
import 'package:rentease/PropertyList/Provider/get_property_list.dart';
import 'package:rentease/LoginPage/Pages/login_page.dart';
import 'package:rentease/PropertyList/Model/property_model.dart';

class PropertyDetails extends StatefulWidget {
  const PropertyDetails({super.key});
  @override
  State<PropertyDetails> createState() => _PropertyDetailsState();
}

class _PropertyDetailsState extends State<PropertyDetails> {
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  child: Column(
                    children: [
                      FutureBuilder<List<PropertyModel>>(
                        future: PropertyList.instance.propertyData(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final propertyList = snapshot.data!;
                            return Column(
                              children: propertyList
                                  .map((e) => SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .6,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 10,
                                                bottom: 50,
                                              ),
                                              child: Image.asset(
                                                "images/RentEase-v1.png",
                                                height: 200,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    1,
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10),
                                                child: Text(
                                                  'BDT ${e.rent}',
                                                  style: const TextStyle(
                                                      fontSize: 25),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              child: Wrap(children: [
                                                const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                  ),
                                                  child: Icon(
                                                    Icons.pin_drop_outlined,
                                                    color: Colors.black38,
                                                  ),
                                                ),
                                                Text(
                                                  e.address,
                                                  style: const TextStyle(
                                                      fontSize: 18),
                                                ),
                                              ]),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              child: Wrap(children: [
                                                const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                  ),
                                                  child: Icon(
                                                    Icons.house,
                                                    color: Colors.black38,
                                                  ),
                                                ),
                                                Text(
                                                  "${e.area} sqft",
                                                  style: const TextStyle(
                                                      fontSize: 18),
                                                ),
                                              ]),
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 10),
                                                  child: Wrap(children: [
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                      ),
                                                      child: Icon(
                                                        Icons.bathtub_outlined,
                                                        color: Colors.black38,
                                                      ),
                                                    ),
                                                    Text(
                                                      e.baths,
                                                      style: const TextStyle(
                                                          fontSize: 18),
                                                    ),
                                                  ]),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 10),
                                                  child: Wrap(children: [
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                      ),
                                                      child: Icon(
                                                        Icons.bed,
                                                        color: Colors.black38,
                                                      ),
                                                    ),
                                                    Text(
                                                      e.rooms,
                                                      style: const TextStyle(
                                                          fontSize: 18),
                                                    ),
                                                  ]),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 10),
                                              child: Text(
                                                e.title,
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.green),
                                              ),
                                            )
                                          ],
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
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
