import 'package:flutter/material.dart';

class AdoptedPetsPage extends StatelessWidget {
  final String name;
  const AdoptedPetsPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adopted Pets')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Adopted Pets List', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            Text('Congratulations $name, you have successfully adopted a pet!',
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            Image.network('https://placekitten.com/400/400'),
          ],
        ),
      ),
    );
  }
}
