import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rentease/HomePage/Pages/home_page.dart';
import 'package:rentease/SignUp/Provider/user_repository.dart';

import '../Pages/owner_landing.dart';
import '../Pages/vacancies.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            leading: const Icon(
              Icons.home_outlined,
              size: 30,
            ),
            iconColor: Colors.black,
            title: const Text(
              'Home',
              style: TextStyle(fontSize: 17),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const OwnerUI()));
            },
          ),
          ListTile(
            splashColor: Colors.green.shade300,
            leading: const Icon(
              Icons.manage_search_outlined,
              size: 30,
            ),
            iconColor: Colors.black,
            title: const Text(
              'Vacancies',
              style: TextStyle(fontSize: 17),
            ),
            subtitle: const Text("post or check vacancies"),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Vacancies()));
            },
          ),
          ListTile(
            splashColor: Colors.green.shade300,
            leading: const Icon(
              Icons.manage_search_outlined,
              size: 30,
            ),
            iconColor: Colors.black,
            title: const Text(
              'Profile',
              style: TextStyle(fontSize: 17),
            ),
            subtitle: const Text("check your profile"),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Vacancies()));
            },
          ),
          ListTile(
            splashColor: Colors.green.shade300,
            leading: const Icon(Icons.logout_outlined, size: 30),
            iconColor: Colors.black,
            title: const Text(
              'Log Out',
              style: TextStyle(fontSize: 17),
            ),
            onTap: () {
              FirebaseAuth.instance.signOut();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Logged Out from '),
                  backgroundColor: Colors.red,
                ),
              );
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
        ],
      ),
    );
  }
}
