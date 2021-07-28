import 'package:flutter/material.dart';
import 'package:happy_meal/provider/prov_theme.dart';
import 'package:happy_meal/providers.dart';
import 'package:happy_meal/screens/theme_screen.dart';

import 'package:provider/provider.dart';

import './screens/filter_screen.dart';
import './screens/tap_Screen.dart';
import './screens/item_meal_screen.dart';
import './screens/menuMeal.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Provmeal>(
          create: (_) => Provmeal(),
        ),
        ChangeNotifierProvider<ProvTheme>(
          create: (_) => ProvTheme(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var primaryColor = Provider.of<ProvTheme>(context).primaryColor;
    var accentColor = Provider.of<ProvTheme>(context).accentColor;
    var tm = Provider.of<ProvTheme>(context).tm;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: tm,

      theme: ThemeData(
        // primaryColor: primaryColor,
        primarySwatch: primaryColor,
        accentColor: accentColor,
        canvasColor: Color.fromRGBO(245, 235, 207, 1.0),
        fontFamily: 'Lato',
        buttonColor: Colors.black87,
        cardColor: Colors.white,
        shadowColor: Colors.white60,
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              headline6: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),

      darkTheme: ThemeData(
        //primaryColor: primaryColor,
        primarySwatch: primaryColor,
        accentColor: accentColor,
        canvasColor: Color.fromRGBO(14, 22, 33, 1),
        fontFamily: 'Lato',
        buttonColor: Colors.white70,
        cardColor: Color.fromRGBO(35, 34, 39, 1),
        shadowColor: Colors.white60,
        unselectedWidgetColor: Colors.white70,
        textTheme: ThemeData.dark().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Colors.white60,
              ),
              headline6: TextStyle(
                color: Colors.white70,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      //  initialRoute: '/',
      routes: {
        '/': (ctx) => TabScreen(),
        MenuMeal.routName: (ctx) => MenuMeal(),
        // Menu.routName: (context) => Menu(),
        ItemMealScreen.routName: (ctx) => ItemMealScreen(),
        FilterScreen.routName: (ctx) => FilterScreen(),
        ThemeScreen.routName: (ctx) => ThemeScreen(),
      },
    );
  }
}
