import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers.dart';
import '../widgets/dart/meal.dart';
import '../widgets/dart/itemmeal.dart';
import '../widgets/dart/my_drower.dart';

class MenuMeal extends StatefulWidget {
  static const routName = '/menuMeal';

// دى كاتجورى ميل عندهم

  @override
  _MenuMealState createState() => _MenuMealState();
}

class _MenuMealState extends State<MenuMeal> {
  String nameTitle;
  List<Meal> meals;
  var _loadedInitData = false;
  @override
  void didChangeDependencies() {
    // if (!_loadedInitData) {
    final List<Meal> _availableMeal =
        Provider.of<Provmeal>(context).availableMeal;
    final zipArgument =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    nameTitle = zipArgument['title'];
    final mealId = zipArgument['id'];
    meals = _availableMeal.where((meal) {
      return meal.categories.contains(mealId);
    }).toList();
    // _loadedInitData = true;
    //}

    super.didChangeDependencies();
  }

  void _removeItem(String mealId) {
    setState(() {
      meals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: Text(nameTitle),
        ),
        body: ListView.builder(
            itemCount: meals.length,
            itemBuilder: (ctx, index) {
              return ItemMeal(
                id: meals[index].id,
                title: meals[index].title,
                imageUrl: meals[index].imageUrl,
                duration: meals[index].duration,
                complexity: meals[index].complexity,
                affordability: meals[index].affordability,
              );
            }));
  }
}
