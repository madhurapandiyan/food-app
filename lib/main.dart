import 'package:flutter/material.dart';
import 'package:food_app/screen/favorite_screen.dart';
import 'package:food_app/screen/filterscreen.dart';
import 'package:food_app/screen/tabscreen.dart';
import '/screen/meal_detail.dart';
import 'package:food_app/model/dummy_data.dart';

import 'model/meals.dart';
import 'screen/category_meals.dart';
import 'screen/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> data = {
    "glucton": false,
    "vegan": false,
    "vegetarian": false,
    "lactose": false
  };

  List<Meal> filteredmeals = DUMMY_MEALS;
  List<Meal> favouritemeals = [];

  void addfavaourite(String id) {
    final Meal addedmeals = DUMMY_MEALS.firstWhere((meal) => meal.id == id);
    final int existingindex =
        favouritemeals.indexWhere((meal) => meal.id == id);
    if (existingindex >= 0) {
      setState(() {
        favouritemeals.remove(existingindex);
      });
    } else {
      setState(() {
        favouritemeals.add(addedmeals);
      });
    }
  }

  void setfilter(Map<String, bool> filterdata) {
    setState(() {
      data = filterdata;
      filteredmeals = DUMMY_MEALS.where((element) {
        if (data["glucton"] == true && !element.isGlutenFree) {
          return false;
        }
        if (data["vegan"] == true && !element.isVegan) {
          return false;
        }
        if (data["vegetarian"] == true && !element.isVegetarian) {
          return false;
        }
        if (data["lactose"] == true && !element.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  bool addfavoritemeal(String id) {
    return favouritemeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) => TabScreen(favouritemeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(filteredmeals),
        MealDetail.routeName: (ctx) => MealDetail(
              addfavaourite,addfavoritemeal
            ),
        FavoriteScreen.routename: (ctx) => FavoriteScreen(favouritemeals),
        CategoriesScreen.routename: (ctx) => CategoriesScreen(),
        // ignore: equal_keys_in_map
        Filterscreen.routename: (ctx) => Filterscreen(data, setfilter),
      },
    );
  }
}
