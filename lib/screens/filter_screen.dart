import 'package:flutter/material.dart';
import 'package:happy_meal/provider/prov_theme.dart';
import '../providers.dart';

import 'package:provider/provider.dart';
import '../widgets/dart/my_drower.dart';

class FilterScreen extends StatefulWidget {
  static const routName = '/FilterScreen';

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // bool _glutenFree = false;
  // bool _lactoseFree = false;
  // bool _vegetarian = false;
  //
  // bool _vegan = false;
  //
  // @override
  // // initState
  // didChangeDependencies() {
  //   final Map<String, bool> currentFilters =
  //       Provider.of<Provmeal>(context, listen: false).filters;
  //   _glutenFree = currentFilters['gluten'];
  //   _lactoseFree = currentFilters['lactose'];
  //   _vegetarian = currentFilters['vegetarian'];
  //   _vegan = currentFilters['vegan'];
  //   super.didChangeDependencies();
  // }

  //didChangeDependencies

  //didChangeDependencies

  Widget buildSwitchListTile(
      String title, String description, bool currentValue, Function x) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: x,
      inactiveTrackColor: Provider.of<ProvTheme>(context).tm == ThemeMode.light
          ? null
          : Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, bool> currentFilters =
        Provider.of<Provmeal>(context).filters;
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.save),
        //     onPressed: () {
        //       final netFilter = {
        //         'gluten': _glutenFree,
        //         'lactose': _lactoseFree,
        //         'vegan': _vegan,
        //         'vegetarian': _vegetarian,
        //       };
        //       Provider.of<Provmeal>(context, listen: false)
        //           .setFilter(netFilter);
        //     },
        //   ),
        // ],
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Container(
            child: Text('you can filter your meal'),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile('gluten_free', 'no meals contain Gluten',
                    currentFilters['gluten'], (val) {
                  setState(() {
                    currentFilters['gluten'] = val;
                  });
                  Provider.of<Provmeal>(context, listen: false).setFilter();
                }),
                buildSwitchListTile(
                  'LactoseFree',
                  'no meals contain lactose',
                  currentFilters['lactose'],
                  (val) {
                    setState(
                      () {
                        currentFilters['lactose'] = val;
                      },
                    );
                    Provider.of<Provmeal>(context, listen: false).setFilter();
                  },
                ),
                buildSwitchListTile(
                  'Vegetarian',
                  'no meals contain vegvtarian',
                  currentFilters['vegetarian'],
                  (val) {
                    setState(
                      () {
                        currentFilters['vegetarian'] = val;
                      },
                    );
                    Provider.of<Provmeal>(context, listen: false).setFilter();
                  },
                ),
                buildSwitchListTile(
                    'Vegan', 'no meals contain vegan', currentFilters['vegan'],
                    (val) {
                  setState(() {
                    currentFilters['vegan'] = val;
                  });
                  Provider.of<Provmeal>(context, listen: false).setFilter();
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
