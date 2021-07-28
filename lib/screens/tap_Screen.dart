import 'package:flutter/material.dart';
import 'package:happy_meal/provider/prov_theme.dart';

import 'package:provider/provider.dart';
import '../providers.dart';
import '../screens/myFavorites.dart';
import '../widgets/dart/my_drower.dart';

import 'menuScreen.dart';

class TabScreen extends StatefulWidget {
  static const routName = '/';

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List _page;
  int _statIndex = 0;

  @override
  void initState() {
    Provider.of<Provmeal>(context, listen: false).getData();
    Provider.of<ProvTheme>(context, listen: false).getThemeMode();
    Provider.of<ProvTheme>(context, listen: false).getColor();

    _page = [
      {
        'title': 'Ganeril menu',
        'page': Menu(),
      },
      {
        'title': 'MyFavorites',
        'page': MyFavorites(),
      },
    ];

    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _statIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: _page[_statIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).accentColor,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        currentIndex: _statIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            // ignore: deprecated_member_use
            title: Text('Menu'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            // ignore: deprecated_member_use
            title: Text('My Favorites'),
          ),
        ],
      ),
    );
  }
}
