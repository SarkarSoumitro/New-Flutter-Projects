import 'package:flutter/material.dart';

import 'pet_details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome to Pet World')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Welcome to Pet World!', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PetDetailsPage()),
                );
              },
              child: Image.network(
                'https://placekitten.com/200/200',
                width: 200,
                height: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
