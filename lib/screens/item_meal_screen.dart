import 'package:flutter/material.dart';
import 'package:happy_meal/dummy_data.dart';

import 'package:provider/provider.dart';

import '../providers.dart';

class ItemMealScreen extends StatelessWidget {
  static const routName = '/item_Meal_Screen';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    var accent = Theme.of(context).accentColor;
    return Scaffold(
      appBar: AppBar(
        title: Text(selectMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 15),
              child: Image.network(
                selectMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ), //الصورة
            buildText('ingredients', context), //العنوان
            buildContainer(
              ListView.builder(
                  itemCount: selectMeal.ingredients.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      color: accent,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(
                          selectMeal.ingredients[index],
                          style: TextStyle(
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            buildText('steps', context),
            buildContainer(
              ListView.builder(
                  itemCount: selectMeal.steps.length,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('(${index + 1})'),
                          ),
                          title: Text(selectMeal.steps[index],
                              style: TextStyle(color: Colors.black)
                              //Theme.of(context).textTheme.headline6,
                              ),
                        ),
                        Divider()
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Provider.of<Provmeal>(context, listen: false)
            .toggleFavoriteMeals(mealId),
        child: Icon(
          Provider.of<Provmeal>(context).isMealFavorite(mealId)
              ? Icons.favorite
              : Icons.favorite_border,
          //color: Colors.yellow,
        ),
      ),
    );
  }

  Text buildText(String title, BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline6,
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      height: 150,
      width: 300,
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
