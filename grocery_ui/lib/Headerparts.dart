import 'package:flutter/material.dart';
import 'package:grocery_ui/utils/colors.dart';

class Headerparts extends StatefulWidget {
  const Headerparts({super.key});

  @override
  State<Headerparts> createState() => _HeaderpartsState();
}

class _HeaderpartsState extends State<Headerparts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [topheader()],
    );
  }

  Padding topheader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Material(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.menu_open_rounded,
                    color: Colors.black,
                  ),
                )),
          ),
          const Spacer(),
          const Icon(
            Icons.location_on,
            color: primaryColors,
            size: 18,
          ),
          const Text(
            "Bangladesh",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.asset(
              "assets/my.jpg",
              height: 50,
              width: 50,
            ),
          )
        ],
      ),
    );
  }
}
