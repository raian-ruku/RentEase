import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../../HomePage/Pages/home_page.dart';
import '../Constants/custom_drawer.dart';
import 'owner_landing.dart';

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
                              return const Scaffold();
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
                            return const Scaffold();
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
