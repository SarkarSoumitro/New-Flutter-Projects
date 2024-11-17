import 'package:doctor_appointment_ui/Model/doctor.dart';
import 'package:flutter/material.dart';

class DoctorDetailScreen extends StatefulWidget {
  final Doctor doctor;
  const DoctorDetailScreen({super.key, required this.doctor});

  @override
  State<DoctorDetailScreen> createState() => _DoctorDetailScreenState();
}

class _DoctorDetailScreenState extends State<DoctorDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      extendBody: true,
      body: SafeArea(
          child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
