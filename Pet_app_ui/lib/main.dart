import 'package:flutter/material.dart';
import 'package:pet_app_ui/pages/home_screen.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PetHomeScreen(),
    );
  }
}
