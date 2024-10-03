import 'package:flutter/material.dart';
import 'package:registration_by_api/Screens/Login.dart';

void main() {
  runApp(new Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: HomeScreen(),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
