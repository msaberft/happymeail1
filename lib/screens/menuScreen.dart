import 'package:flutter/material.dart';
import 'package:happy_meal/widgets/dart/my_drower.dart';

import '../widgets/dart/gridItem.dart';

class Menu extends StatelessWidget {
  static const routName = '/menu';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('انواع الاطعمه '),
      ),
      body: GridItem(),
    );
  }
}
