import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_shop_app_ui/screens/item_details.dart';

import '../model/Model.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  TextEditingController searchController = TextEditingController();
  List<Item> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = foodShopItems();
    searchController.addListener(_filterItems);
  }

  void _filterItems() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredItems = foodShopItems().where((item) {
        return item.title.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .05),
        child: Column(
          children: [
            const MyAppBar(),
            const SizedBox(height: 8),
            const Text(
              "Fruits and Berries",
              style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 8),
            SearchBar(controller: searchController),
            const SizedBox(height: 20),
            Expanded(
              child: MasonryGridView.builder(
                itemCount: filteredItems.length,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10,
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final item = filteredItems[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ItemDetails(item: item),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.only(top: 15, left: 20),
                      height: item.height.toDouble(),
                      decoration: BoxDecoration(
                        color: item.color,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.title,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          Text(item.lb,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black)),
                          Text("\$${item.price}",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          Expanded(
                            child: Image.asset(item.imageUrl),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 123),
                            child: Container(
                              height: 40,
                              width: 30,
                              decoration: BoxDecoration(
                                color: item.myItems ? item.color : Colors.grey,
                                border: Border(
                                  top: BorderSide(width: 8, color: item.color),
                                  left: BorderSide(width: 2, color: item.color),
                                ),
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(25),
                                  topLeft: Radius.circular(25),
                                ),
                              ),
                              child: Icon(
                                item.myItems ? Icons.check_sharp : Icons.add,
                                size: 20,
                                color:
                                    item.myItems ? Colors.white : Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final TextEditingController controller;

  const SearchBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: const TextStyle(fontSize: 16, color: Colors.black26),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding: const EdgeInsets.all(20),
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 25, right: 15),
          child: Icon(Icons.search, size: 30),
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 55,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(Icons.keyboard_arrow_left, size: 22),
          ),
          Image.asset("images/two line.png", height: 40, width: 40)
        ],
      ),
    );
  }
}
