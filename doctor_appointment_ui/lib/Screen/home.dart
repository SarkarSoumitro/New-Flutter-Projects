import 'package:doctor_appointment_ui/Model/sympton.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        headerparts(),
        const SizedBox(
          height: 20,
        ),
        clinicandhomevisit(),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            "What are your symthoms?",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: -.5,
                color: Colors.black),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          child: Row(
            children: [
              ...List.generate(
                  symptoms.length,
                  (index) => Padding(
                        padding: index == 0
                            ? EdgeInsets.only(left: 15, right: 15)
                            : EdgeInsets.only(right: 15),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 18, vertical: 15),
                        ),
                      ))
            ],
          ),
        ),
      ],
    ));
  }

  Padding clinicandhomevisit() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.purple.withOpacity(0.2),
                  blurRadius: 15,
                  spreadRadius: 5,
                  offset: Offset(-0, 10))
            ], color: Colors.purple, borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.add_circle),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Clinic Visit",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: -1),
                    ),
                    Text(
                      "Make an appointment",
                      style: TextStyle(
                          color: Colors.white38,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0),
                    )
                  ],
                )
              ],
            ),
          )),
          const SizedBox(
            width: 15,
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 15,
                  spreadRadius: 5,
                  offset: Offset(-0, 10))
            ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration:
                      BoxDecoration(color: Colors.purple.withOpacity(0.15)),
                  child: Icon(
                    Icons.home_filled,
                    size: 30,
                    color: Colors.purple,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Home Visit",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          letterSpacing: -1),
                    ),
                    Text(
                      "Call the doctor home",
                      style: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0),
                    )
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }

  Padding headerparts() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                "Soumitro Sarkar",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                "images/hand.png",
                width: 40,
                height: 40,
              )
            ],
          ),
          const CircleAvatar(
            radius: 27,
            backgroundImage: NetworkImage(
                "https://img.freepik.com/free-photo/portrait-3d-female-doctor_23-2151107332.jpg"),
          )
        ],
      ),
    );
  }
}
