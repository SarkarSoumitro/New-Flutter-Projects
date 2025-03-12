import 'package:flutter/material.dart';
import 'package:grocery_ui/Headerparts.dart';
import 'package:grocery_ui/utils/colors.dart';

class Hompage extends StatefulWidget {
  const Hompage({super.key});

  @override
  State<Hompage> createState() => _HompageState();
}

class _HompageState extends State<Hompage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          selectedItemColor: primaryColors,
          unselectedItemColor: Colors.green[200],
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: "Notificatons"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favourites"),
          ]),
      body: ListView(
        children: [
          const SizedBox(
            height: 15,
          ),
          Headerparts()
        ],
      ),
    );
  }
}
