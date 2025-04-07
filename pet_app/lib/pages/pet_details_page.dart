import 'package:flutter/material.dart';

import 'adopt_pet_page.dart';

class PetDetailsPage extends StatelessWidget {
  const PetDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pet Details')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              'https://placekitten.com/300/300',
              width: 250,
              height: 250,
            ),
            const SizedBox(height: 20),
            const Text(
              'This is your cute pet. Would you like to adopt?',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AdoptPetPage()),
                );
              },
              child: const Text('Adopt this Pet'),
            ),
          ],
        ),
      ),
    );
  }
}
