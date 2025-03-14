import 'package:flutter/material.dart';
import 'package:grocery_ui/utils/colors.dart';

class Headerparts extends StatefulWidget {
  const Headerparts({super.key});

  @override
  State<Headerparts> createState() => _HeaderpartsState();
}

int indexCategory = 0;

class _HeaderpartsState extends State<Headerparts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        topheader(),
        const SizedBox(
          height: 30,
        ),
        Title(),
        const SizedBox(
          height: 21,
        ),
        SearchBar(),
        const SizedBox(
          height: 30,
        ),
        CategorySelection(),
      ],
    );
  }

  Padding CategorySelection() {
    List list = ["All", "Fruits", "Vagetables", "Grocery"];
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: SizedBox(
        height: 35,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    indexCategory = index;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 10),
                    child: Text(
                      list[index],
                      style: TextStyle(
                          fontSize: 20,
                          color: indexCategory == index
                              ? primaryColors
                              : Colors.black45,
                          fontWeight:
                              indexCategory == index ? FontWeight.bold : null),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  Container SearchBar() {
    return Container(
      height: 55,
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: primaryColors,
                ),
                hintText: "Search food",
                hintStyle: TextStyle(color: Colors.black26)),
          )),
          Material(
            color: primaryColors,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                child: Icon(
                  Icons.insert_emoticon_sharp,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding Title() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hi i am Soumitro",
            style: TextStyle(
                color: primaryColors,
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
          Text(
            "Find your food",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 34),
          ),
        ],
      ),
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
