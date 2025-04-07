import 'package:flutter/material.dart';

import '../models/pet.dart';

class PetCard extends StatelessWidget {
  final Pet pet;

  const PetCard({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(pet.imageUrl,
              height: 150, width: 150, fit: BoxFit.cover),
          Text(pet.name),
          Text(pet.breed),
        ],
      ),
    );
  }
}
