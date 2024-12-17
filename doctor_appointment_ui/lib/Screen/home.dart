import 'package:doctor_appointment_ui/Model/doctor.dart';
import 'package:doctor_appointment_ui/Model/sympton.dart';
import 'package:doctor_appointment_ui/Widgets/list_of_doctors.dart';
import 'package:flutter/material.dart';

import 'DoctorDetailScreen.dart';

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
            "What are your symptoms?",
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
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 10,
                          backgroundImage: AssetImage(symptoms[index].image),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          symptoms[index].label,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            "Popular doctors",
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: -.5,
                color: Colors.black),
          ),
        ),
        Expanded(
          child: GridView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(15),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              crossAxisSpacing: 16,
              mainAxisSpacing: 14,
              childAspectRatio: 0.8, // Adjust to control card height
            ),
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DoctorDetailScreen(
                        doctor: doctors[index],
                      ),
                    ),
                  );
                },
                child: ListOfDoctor(doctor: doctors[index]),
              );
            },
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
