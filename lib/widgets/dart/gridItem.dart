import 'package:flutter/material.dart';
import 'package:happy_meal/dummy_data.dart';
import 'package:happy_meal/providers.dart';

import 'package:happy_meal/widgets/dart/categoryItem.dart';
import 'package:provider/provider.dart';

class GridItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(20),
        children: Provider.of<Provmeal>(context)
                    .availableCategory
                    .map((val) => CategoryItem(val.title, val.id, val.color))
                    .toList() ==
                null
            ? Text('test')
            : Provider.of<Provmeal>(context)
                .availableCategory
                .map((val) => CategoryItem(val.title, val.id, val.color))
                .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisSpacing: 20,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          maxCrossAxisExtent: 200,
        ));
  }
}
