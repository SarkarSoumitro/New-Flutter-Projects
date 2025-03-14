import 'package:flutter/material.dart';
import 'package:grocery_ui/Detailspage.dart';
import 'package:grocery_ui/utils/colors.dart';
import 'package:grocery_ui/utils/items_model.dart';

class ItemsDisplay extends StatefulWidget {
  const ItemsDisplay({super.key});

  @override
  State<ItemsDisplay> createState() => _ItemsDisplayState();
}

class _ItemsDisplayState extends State<ItemsDisplay> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: foodsItems.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 265,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8),
        itemBuilder: (context, index) {
          FoodDetail food = foodsItems[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(food: food)));
            },
            child: Container(
              height: 265,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20)),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(125),
                          child: Image.network(
                            food.image,
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          food.name,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Text(
                              food.cookingTime,
                              style: TextStyle(color: Colors.black38),
                            ),
                            Spacer(),
                            Icon(
                              Icons.star,
                              size: 18,
                              color: Colors.amber,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              food.rate.toString(),
                              style: TextStyle(color: Colors.black38),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          '\$${food.price}.00',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 150, top: 10),
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.black45,
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Material(
                        color: primaryColors,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(18),
                            bottomRight: Radius.circular(18)),
                        child: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          );
        });
  }
}
