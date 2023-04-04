import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../../HomePage/Pages/home_page.dart';
import '../Constants/custom_drawer.dart';
import 'owner_landing.dart';
import 'package:rentease/PropertyList/Model/property_model.dart';
import 'package:rentease/PropertyList/Provider/property_list.dart';

class Vacancies extends StatelessWidget {
  const Vacancies({super.key});

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
      drawer: const CustomDrawer(),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
            child: Column(
              children: [
                const SizedBox(height: 300),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const PostVacancy();
                            },
                          ),
                        );
                      },
                      style: ButtonStyle(
                        splashFactory: NoSplash.splashFactory,
                        backgroundColor: MaterialStateProperty.all(
                            Colors.grey.withOpacity(0.8)),
                      ),
                      child: const Text(
                        "Post Vacant Apartments",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const OwnerUI();
                          },
                        ),
                      );
                    },
                    style: ButtonStyle(
                      splashFactory: NoSplash.splashFactory,
                      backgroundColor: MaterialStateProperty.all(
                          Colors.green.withOpacity(0.8)),
                    ),
                    child: const Text(
                      "Check Posted Vacancy",
                      style: TextStyle(fontSize: 20),
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

class PostVacancy extends StatefulWidget {
  const PostVacancy({super.key});

  @override
  State<PostVacancy> createState() => _PostVacancyState();
}

class _PostVacancyState extends State<PostVacancy> {
  PropertyModel? vacancy;
  PropertyList propertyList = PropertyList();
  final formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  final _addressController = TextEditingController();
  final _roomController = TextEditingController();
  final _bathController = TextEditingController();
  final _rentController = TextEditingController();
  final _areaController = TextEditingController();

  addVacancy() {
    if (formKey.currentState!.validate()) {
      {
        vacancy = PropertyModel(
          description: _descriptionController.text,
          address: _addressController.text,
          rooms: _roomController.text,
          baths: _bathController.text,
          rent: _rentController.text,
          area: _areaController.text,
          category: _selecthomeType.toString(),
        );
        propertyList.addVacancy(vacancy!);
      }
    }
  }

  late List<String> _homeType;
  String? _selecthomeType;
  @override
  void initState() {
    _homeType = ['Bachelors', 'Family'];
    debugPrint(_homeType.length.toString());

    super.initState();
  }

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
        drawer: const CustomDrawer(),
        body: Form(
          key: formKey,
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 1,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _descriptionController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Description is required';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'Description',
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 0.686),
                                fontSize: 15),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(0, 0, 0, 0.686),
                                  width: 2.0),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: _addressController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Address is required';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'Address',
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 0.686),
                                fontSize: 15),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(0, 0, 0, 0.686),
                                  width: 2.0),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 150,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Number of Bedrooms is required';
                                  }
                                  return null;
                                },
                                controller: _roomController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  errorStyle: TextStyle(fontSize: 10),
                                  labelText: 'Number of Rooms',
                                  labelStyle: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 0.686),
                                      fontSize: 15),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(0, 0, 0, 0.686),
                                        width: 2.0),
                                  ),
                                ),
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            SizedBox(
                              width: 150,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Number of Bathrooms is required';
                                  }
                                  return null;
                                },
                                controller: _bathController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  errorStyle: TextStyle(fontSize: 10),
                                  labelText: 'Number of Baths',
                                  labelStyle: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 0.686),
                                      fontSize: 15),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(0, 0, 0, 0.686),
                                        width: 2.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 150,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Rent is required';
                                  }
                                  return null;
                                },
                                controller: _rentController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'Rent',
                                  labelStyle: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 0.686),
                                      fontSize: 15),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(0, 0, 0, 0.686),
                                        width: 2.0),
                                  ),
                                ),
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            SizedBox(
                              width: 150,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Area is required';
                                  }
                                  return null;
                                },
                                controller: _areaController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'Area in Sqft',
                                  labelStyle: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 0.686),
                                      fontSize: 15),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(0, 0, 0, 0.686),
                                        width: 2.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade400),
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                value: _selecthomeType,
                                hint: const Text('Select category of Home'),
                                onChanged: (newValue) {
                                  setState(() {
                                    _selecthomeType = newValue.toString();
                                  });
                                },
                                items: _homeType.map((valueItem) {
                                  return DropdownMenuItem(
                                    value: valueItem,
                                    child: Text(
                                      valueItem,
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                }).toList(),
                              )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: OutlinedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.green.withOpacity(.9))),
                            onPressed: () {
                              addVacancy();
                            },
                            child: const Text(
                              "Post Vacancy",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
