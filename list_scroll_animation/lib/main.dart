import 'package:flutter/material.dart';
import 'package:list_scroll_animation/scroll_list.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePages(),
    );
  }
}
