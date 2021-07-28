import 'package:flutter/material.dart';
import 'package:happy_meal/screens/item_meal_screen.dart';

import 'meal.dart';

class ItemMeal extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  ItemMeal({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'unknown';
    }
  }

  // ignore: non_constant_identifier_names
  String get AffordabilityText {
    switch (affordability) {
      case Affordability.Pricey:
        return 'pricey';
        break;
      case Affordability.Affordable:
        return 'Affordable';
        break;

      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return '';
    }
  }

  void _selectMeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(
      ItemMealScreen.routName,
      arguments: id,
    )
        .then((result) {
      //  if (result != null) removeItem(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                    width: 200,
                    color: Colors.black38,
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '$duration min',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.work,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        complexityText,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                        color: Colors.blue,
                      ),
                      Text(
                        AffordabilityText,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
