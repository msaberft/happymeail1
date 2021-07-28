import 'package:flutter/material.dart';
import 'package:happy_meal/provider/prov_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ThemeScreen extends StatelessWidget {
  static const routName = '/themeScreen';

  Widget buildRadioListTile(
    ThemeMode themeVal,
    String txt,
    IconData icon,
    BuildContext ctx,
  ) {
    return RadioListTile(
      secondary: Icon(
        icon,
        color: Theme.of(ctx).buttonColor,
      ),
      value: themeVal,
      groupValue: Provider.of<ProvTheme>(ctx, listen: true).tm,
      onChanged: (newThemeVal) => Provider.of<ProvTheme>(ctx, listen: false)
          .themeModeChange(newThemeVal),
      title: Text(txt),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my Theme'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'adjestc  your theme ',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                (Container(
                  padding: EdgeInsets.all(20),
                  child: Text('Chosse your Theme Mode'),
                )),
                buildRadioListTile(
                    ThemeMode.system, 'system Default Theme', null, context),
                buildRadioListTile(ThemeMode.light, 'light Theme',
                    Icons.wb_sunny_outlined, context),
                buildRadioListTile(ThemeMode.dark, 'dark Theme',
                    Icons.nights_stay_outlined, context),
                buildListTile(context, 'primary'),
                buildListTile(context, 'accent')
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListTile buildListTile(BuildContext context, txt) {
    var primaryColor =
        Provider.of<ProvTheme>(context, listen: true).primaryColor;
    var accentColor = Provider.of<ProvTheme>(context, listen: true).accentColor;
    return ListTile(
      title: Text(
        'Choose your $txt color',
        style: Theme.of(context).textTheme.headline6,
      ),
      trailing: CircleAvatar(
        backgroundColor: txt == 'primary' ? primaryColor : accentColor,
      ),
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return AlertDialog(
                elevation: 4,
                titlePadding: const EdgeInsets.all(0.0),
                contentPadding: const EdgeInsets.all(0.0),
                content: SingleChildScrollView(
                  child: ColorPicker(
                    pickerColor: txt == 'primary'
                        ? Provider.of<ProvTheme>(ctx, listen: true).primaryColor
                        : Provider.of<ProvTheme>(ctx, listen: true).accentColor,
                    onColorChanged: (newColor) =>
                        Provider.of<ProvTheme>(context, listen: false)
                            .onChanged(newColor, txt == 'primary' ? 1 : 2),
                    colorPickerWidth: 300,
                    pickerAreaHeightPercent: .7,
                    enableAlpha: false,
                    displayThumbColor: true,
                    showLabel: false,
                  ),
                ),
              );
            });
      },
    );
  }
}
