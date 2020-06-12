import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = "/filters";

  final Function saveFilters;
  final Map<String, bool> _filters;
  FiltersScreen(this.saveFilters, this._filters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget._filters['gluten'];
    _vegetarian = widget._filters['vegetarian'];
    _vegan = widget._filters['vegan'];
    _lactoseFree = widget._filters['lactose'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      String text, String subtitle, bool value, Function handleChange) {
    return SwitchListTile(
      title: Text(text),
      subtitle: Text(subtitle),
      value: value,
      onChanged: handleChange,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            color: Colors.white,
            onPressed: () {
              widget.saveFilters({
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              });
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust you meal selection.",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile("Gluten free",
                    "Only showing gluten free meals", _glutenFree, (value) {
                  setState(() {
                    _glutenFree = value;
                  });
                }),
                _buildSwitchListTile(
                    "Vegetarian", "Only showing Vegetarian meals", _vegetarian,
                    (value) {
                  setState(() {
                    _vegetarian = value;
                  });
                }),
                _buildSwitchListTile(
                    "vegan", "Only showing vegan meals", _vegan, (value) {
                  setState(() {
                    _vegan = value;
                  });
                }),
                _buildSwitchListTile("Lactose Free",
                    "Only showing lactose free meals", _lactoseFree, (value) {
                  setState(() {
                    _lactoseFree = value;
                  });
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
