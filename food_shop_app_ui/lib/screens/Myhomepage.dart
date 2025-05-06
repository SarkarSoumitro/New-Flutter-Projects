import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_shop_app_ui/model/Model.dart';
import 'package:food_shop_app_ui/screens/item_details.dart';

class Myhomepage extends StatefulWidget {
  const Myhomepage({super.key});

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .05),
        child: Column(
          children: [
            Myappbar(),
            SizedBox(
              height: MediaQuery.of(context).size.height * .008,
            ),
            Text(
              "Fruits and berries",
              style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .008,
            ),
            searchbar(),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: MasonryGridView.builder(
                    crossAxisSpacing: 20,
                    itemCount: foodShopItems().length,
                    gridDelegate:
                        SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      final item = foodShopItems()[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ItemDetails(item: item),
                                ));
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 15, left: 20),
                            height: item.height.toDouble(),
                            decoration: BoxDecoration(
                                color: item.color,
                                borderRadius: BorderRadius.circular(30)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Text(
                                  item.lb,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                                Text(
                                  "\$${item.price}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Expanded(
                                  child: Image.asset(
                                    item.imageUrl,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 123),
                                  child: Container(
                                    height: 40,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color: item.myItems == true
                                            ? item.color
                                            : Colors.grey,
                                        border: Border(
                                            top: BorderSide(
                                                width: 8, color: item.color),
                                            left: BorderSide(
                                                width: 2, color: item.color)),
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(25),
                                            topLeft: Radius.circular(25))),
                                    child: Icon(
                                      item.myItems == true
                                          ? Icons.check_sharp
                                          : Icons.add,
                                      size: 20,
                                      color: item.myItems == true
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}

class searchbar extends StatelessWidget {
  const searchbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: "Search",
          hintStyle: TextStyle(fontSize: 16, color: Colors.black26),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Colors.grey[100],
          contentPadding: EdgeInsets.all(20),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 25, right: 15),
            child: Icon(
              Icons.search,
              size: 30,
            ),
          )),
    );
  }
}

class Myappbar extends StatelessWidget {
  const Myappbar({
    super.key,
  });

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
                  borderRadius: BorderRadius.circular(15)),
              child: Icon(
                Icons.keyboard_arrow_left,
                size: 22,
              ),
            ),
            Image.asset(
              "images/two line.png",
              height: 40,
              width: 40,
            )
          ],
        ));
  }
}
