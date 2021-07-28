import 'package:flutter/material.dart';
import 'package:happy_meal/widgets/dart/category.dart';
import 'package:happy_meal/widgets/dart/meal.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'dummy_data.dart';

class Provmeal with ChangeNotifier {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> availableMeal = DUMMY_MEALS;
  List<Meal> myFavoriteMeals = [];
  List<String> prefavort = [];
  List<Category> availableCategory = [];

  void setFilter() async {
    // filters = filterData;
    availableMeal = DUMMY_MEALS.where((val) {
      if (filters['gluten'] && !val.isGlutenFree) {
        return false;
      }
      if (filters['lactose'] && !val.isLactoseFree) {
        return false;
      }
      if (filters['vegan'] && !val.isVegan) {
        return false;
      }
      if (filters['vegetarian'] && !val.isVegetarian) {
        return false;
      }

      return true;
    }).toList();

    List<Category> ac = [];
    availableMeal.forEach((meal) {
      meal.categories.forEach((catId) {
        DUMMY_CATEGORIES.forEach((cat) {
          if (cat.id == catId) {
            if (!ac.any((meal) => meal.id == catId)) ac.add(cat);
          }
        });
      });
    });
    availableCategory = ac;
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('gluten', filters['gluten']);
    prefs.setBool('lactose', filters['lactose']);
    prefs.setBool('vegan', filters['vegan']);
    prefs.setBool('vegetarian', filters['vegetarian']);
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    filters['gluten'] = prefs.getBool('gluten') ?? false;
    filters['lactose'] = prefs.getBool('lactose') ?? false;
    filters['vegan'] = prefs.getBool('vegan') ?? false;
    filters['vegetarian'] = prefs.getBool('vegetarian') ?? false;
    prefavort = prefs.getStringList('prefavort') ?? [];

    for (var mealId in prefavort) {
      final existIndex =
          myFavoriteMeals.indexWhere((meal) => meal.id == mealId);
      if (existIndex < 0) {
        myFavoriteMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      }
    }

    notifyListeners();
  }

  void toggleFavoriteMeals(String mealId) async {
    final existIndex = myFavoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existIndex >= 0) {
      myFavoriteMeals.removeAt(existIndex);
      prefavort.remove(mealId);
    } else {
      myFavoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      prefavort.add(mealId);
    }

    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setStringList('prefavort', prefavort);
  }

  bool isMealFavorite(String mealId) {
    return myFavoriteMeals.any((meal) => meal.id == mealId);
  }
}
