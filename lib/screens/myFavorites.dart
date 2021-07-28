import 'package:flutter/material.dart';
import 'package:happy_meal/widgets/dart/itemmeal.dart';
import 'package:happy_meal/widgets/dart/meal.dart';
import 'package:provider/provider.dart';
import '../providers.dart';


class MyFavorites extends StatelessWidget {
  // static const routName = '/myFavorites';

  @override
  Widget build(BuildContext context) {
    final List<Meal> favorites = Provider.of<Provmeal>(context).myFavoriteMeals;
    if (favorites.isEmpty) {
      return Center(
        child: Text('you are welcome'),
      );
    } else {
      return ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (ctx, index) {
            return ItemMeal(
              id: favorites[index].id,
              title: favorites[index].title,
              imageUrl: favorites[index].imageUrl,
              duration: favorites[index].duration,
              complexity: favorites[index].complexity,
              affordability: favorites[index].affordability,
            );
          });
    }
  }
}
