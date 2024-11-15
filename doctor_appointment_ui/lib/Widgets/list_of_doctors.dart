import 'package:flutter/material.dart';

import '../Model/doctor.dart';

class ListOfDoctor extends StatelessWidget {
  final Doctor doctor;
  const ListOfDoctor({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12), // Reduced padding
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width / 2.3, // Adjust max width
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40, // Reduced radius
            backgroundColor: Color(doctor.color),
            backgroundImage: NetworkImage(doctor.image),
          ),
          const SizedBox(height: 10),
          Flexible(
            child: Text(
              "Dr. ${doctor.name}",
              style: const TextStyle(
                fontSize: 16, // Reduced font size
                letterSpacing: -.5,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis, // Handle overflow
              maxLines: 1, // Limit to 1 line
            ),
          ),
          const SizedBox(height: 5),
          Flexible(
            child: Text(
              doctor.specialist,
              style: const TextStyle(
                fontSize: 14, // Reduced font size
                letterSpacing: 0,
                color: Colors.black26,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.orange[50],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.orange,
                  size: 18, // Reduced icon size
                ),
                const SizedBox(width: 5),
                Text(
                  rate(doctor).toStringAsFixed(1),
                  style: const TextStyle(fontSize: 14), // Adjusted font size
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
