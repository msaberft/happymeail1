import 'package:flutter/material.dart';
import 'package:happy_meal/screens/menuMeal.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String id;
  final Color color;

  const CategoryItem(this.title, this.id, this.color);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(MenuMeal.routName, arguments: {
          'id': id,
          'title': title,
        });
      },
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
      ),
    );
  }
}
