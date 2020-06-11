import 'package:flutter/material.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

// MyApp Widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meals App",
      initialRoute: "/",
      routes: {
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        "/": (ctx) => CategoriesScreen()
      },
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
    );
  }
}

class MyHomePageState extends StatefulWidget {
  @override
  _MyHomePageStateState createState() => _MyHomePageStateState();
}

// MyHomePageState Widget
class _MyHomePageStateState extends State<MyHomePageState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meals App"),
      ),
      body: Center(
        child: Text("Navigation Time!"),
      ),
    );
  }
}
