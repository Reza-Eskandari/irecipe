import 'package:flutter/material.dart';
import 'package:irecipe2/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function setFilters;
  final Map<String, bool> currentFilters;

  FilterScreen(this.currentFilters, this.setFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool glutenFree = false;
  bool vegeterian = false;
  bool vegan = false;
  bool lactoseFree = false;

  Widget buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(
        description,
      ),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilter = {
                'gluten': glutenFree,
                'lactose': vegeterian,
                'vegan': vegan,
                'vegetarian': lactoseFree,
              };
              widget.setFilters(selectedFilter);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "ADJUST MEALS",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchListTile(
                  "Gluten-free",
                  "Only include gluten-free meals",
                  glutenFree,
                  (newValue) {
                    setState(
                      () {
                        glutenFree = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  "Lactose-Free",
                  "Only include lactose -free meals",
                  lactoseFree,
                  (newValue) {
                    setState(
                      () {
                        lactoseFree = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  "Vegeterian",
                  "Only include vegeterian meals",
                  vegeterian,
                  (newValue) {
                    setState(
                      () {
                        vegeterian = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  "Vegan",
                  "Only include vegan meals",
                  vegan,
                  (newValue) {
                    setState(
                      () {
                        vegan = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
