import 'package:flutter/material.dart';

import '../models/pets_model.dart'; // Ensure categoryList is correctly imported

class PetHomeScreen extends StatefulWidget {
  const PetHomeScreen({super.key});

  @override
  State<PetHomeScreen> createState() => _PetHomeScreenState();
}

class _PetHomeScreenState extends State<PetHomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile picture and name section
              Padding(
                padding: const EdgeInsets.only(left: 22),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("assets/profile.jpg"),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      "Hi, Soumitro",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),

              // Title
              Padding(
                padding: const EdgeInsets.only(left: 22),
                child: Text.rich(
                  TextSpan(
                    text: "Adopt\n",
                    style: const TextStyle(
                      height: 1.1,
                      fontSize: 37,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      const TextSpan(
                        text: "your pet's here",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 22),

              // Category Selection
              if (categoryList.isNotEmpty) categorySelection(),
            ],
          ),
        ),
      ),
    );
  }

  // Extracted method for category selection
  Widget categorySelection() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length, // Ensure categoryList is not null
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () => setState(() => selectedIndex = index),
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 10),
              child: Column(
                children: [
                  Container(
                    height: 80,
                    width: 75,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xffFF9166)
                          : const Color(0xffFF9166).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        if (isSelected)
                          BoxShadow(
                            color: const Color(0xffFF9166).withOpacity(0.5),
                            blurRadius: 12,
                            spreadRadius: 1,
                          ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        categoryList[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.amber[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
