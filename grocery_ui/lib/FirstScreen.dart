import 'package:flutter/material.dart';
import 'package:grocery_ui/Hompage.dart';
import 'package:grocery_ui/utils/colors.dart';

class Firstscreen extends StatefulWidget {
  const Firstscreen({super.key});

  @override
  State<Firstscreen> createState() => _FirstscreenState();
}

class _FirstscreenState extends State<Firstscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColors,
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Image.asset(
                "assets/fourth.png",
                height: 300,
                width: 300,
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                "Online Delivery at \n your doorstep",
                style: TextStyle(
                  fontSize: 35,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                "Home delivery and reservation \nsystem for restuarent and cafe",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 60,
              ),
              Container(
                height: 55,
                width: double.infinity,
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Hompage()));
                    },
                    child: Text(
                      "Let's Explore",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: primaryColors),
                    )),
              )
            ],
          ),
        ));
  }
}
