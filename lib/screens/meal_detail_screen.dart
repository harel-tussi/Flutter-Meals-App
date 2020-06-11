import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-details";

  Widget buildSectionTitle(BuildContext ctx, String text) {
    return Container(
      child: Text(
        text,
        style: Theme.of(ctx).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      ),
      height: 205,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 300,
              child: Image.network(meal.imageUrl),
            ),
            SizedBox(
              height: 10,
            ),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Container(
                    child: Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(meal.ingredients[index]),
                      ),
                    ),
                  );
                },
              ),
            ),
            buildSectionTitle(context, "Steps"),
            buildContainer(
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index) {
                  return Container(
                      child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text("# ${index + 1}"),
                        ),
                        title: Text(meal.steps[index]),
                      ),
                      Divider(),
                    ],
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
