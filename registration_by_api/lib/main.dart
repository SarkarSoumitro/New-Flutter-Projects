import 'package:flutter/material.dart';

import 'Screens/Registration.dart';

void main() {
  runApp(new Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: HomeScreen(),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
