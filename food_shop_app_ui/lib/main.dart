import 'package:flutter/material.dart';
import 'package:food_shop_app_ui/screens/Splash_screen.dart';

void main() {
  runApp(Newapp());
}

class Newapp extends StatelessWidget {
  const Newapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
