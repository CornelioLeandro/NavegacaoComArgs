import 'package:flutter/material.dart';
import '../components/main_drawer.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  var settings = Settings();

  Widget _createSwitch(String title, String subtitle, bool value,
      Function(bool) onChanged) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Congigurações"),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme
                  .of(context)
                  .textTheme
                  .titleMedium,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _createSwitch('Sem Gluten',
                  'Só exibe refeição sem glutém',
                  settings.isGlutenFree,
                      (value) => setState(() => settings.isGlutenFree = value),
                ),
                _createSwitch('Sem Lactose',
                  'Só exibe refeição sem lactose',
                  settings.isLactoseFree,
                      (value) => setState(() => settings.isLactoseFree = value),
                ),
                _createSwitch('Vegana',
                  'Só exibe refeição vegana',
                  settings.isVegan,
                      (value) => setState(() => settings.isVegan = value),
                ),
                _createSwitch('Vegetariana',
                  'Só exibe refeição sem vegetariana',
                  settings.isVegetarian,
                      (value) => setState(() => settings.isVegetarian = value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
