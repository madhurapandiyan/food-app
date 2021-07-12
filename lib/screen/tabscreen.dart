import 'package:flutter/material.dart';
import 'package:food_app/model/meals.dart';
import 'package:food_app/screen/maindrawer.dart';
import 'categories_screen.dart';
import '/screen/favorite_screen.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favouritemeals;
  static const routename = "/tab";
  TabScreen(this.favouritemeals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late List<Map<String, dynamic>> widgetlist;
  @override
  void initState() {
    widgetlist = [
      {"page": CategoriesScreen(), "title": "Category"},
      {"page": FavoriteScreen(widget.favouritemeals), "title": "Your Favorite"}
    ];
    super.initState();
  }

  int mappiy = 0;

  void selectTab(int index) {
    setState(() {
      // ignore: unrelated_type_equality_checks
      mappiy = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(widgetlist[mappiy]["title"]),
      ),
      body: widgetlist[mappiy]["page"],
      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.shifting,
        currentIndex: mappiy,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        onTap: selectTab,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Category"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourite")
        ],
      ),
    );
  }
}
