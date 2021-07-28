import 'package:flutter/material.dart';
import 'package:happy_meal/screens/filter_screen.dart';

import 'package:happy_meal/screens/tap_Screen.dart';
import 'package:happy_meal/screens/theme_screen.dart';

class MyDrawer extends StatelessWidget {
  Widget buildListTile(
      String title, IconData icon, Function tab, BuildContext ctx) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: Theme.of(ctx).textTheme.bodyText1.color,
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Icon(
        icon,
        color: Theme.of(ctx).buttonColor,
        size: 26,
      ),
      onTap: tab,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            color: Colors.amberAccent,
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Text(
              'My Drawer',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          buildListTile('meal', Icons.restaurant_sharp, () {
            Navigator.of(context).pushReplacementNamed(TabScreen.routName);
          }, context),
          buildListTile('filter', Icons.settings, () {
            Navigator.of(context).pushNamed(FilterScreen.routName);
          }, context),
          buildListTile('Theme', Icons.pageview, () {
            Navigator.of(context).pushNamed(ThemeScreen.routName);
          }, context),
        ],
      ),
    );
  }
}
