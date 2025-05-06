import 'package:flutter/material.dart';
import 'package:food_shop_app_ui/model/Model.dart';

class ItemDetails extends StatelessWidget {
  final Item item;

  const ItemDetails({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: item.color,
      body: SizedBox(
        child: Column(
          children: [
            Padding(
                padding:
                    EdgeInsets.only(top: 50, left: 25, right: 25, bottom: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
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
                    ),
                    Image.asset(
                      "images/two line.png",
                      height: 40,
                      width: 40,
                    )
                  ],
                )),
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .3,
                child: Image.asset(
                  item.imageUrl,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            Expanded(
                child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Padding(
                padding: EdgeInsets.all(35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
                    ),
                    Text(
                      item.lb,
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15))),
                          child: Icon(Icons.remove),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(0),
                                  bottomLeft: Radius.circular(0))),
                          child: Center(
                            child: Text(
                              "1",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15))),
                          child: Icon(Icons.add),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
