import 'package:flutter/material.dart';
import 'package:food_app/model/meals.dart';
import 'category_mealitem.dart';

class FavoriteScreen extends StatefulWidget {
  static const routename = "mappiy";
  final List<Meal> favouritemeal;

  FavoriteScreen(this.favouritemeal);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favouritemeal.isEmpty) {
      return Center(
        child: Text("No favourite meals yet!"),
      );
    } else {
      return ListView.builder(
      itemBuilder: (ctx, index) {
        return CategoryMealItem(
          ingredients: widget.favouritemeal[index].ingredients,
          id: widget.favouritemeal[index].id,
          imagetitle: widget.favouritemeal[index].title,
          imageurl: widget.favouritemeal[index].imageUrl,
          mealaffordability: widget.favouritemeal[index].affordability,
          mealduration: widget.favouritemeal[index].duration,
          mealcomplexity: widget.favouritemeal[index].complexity,
        );
      },
      itemCount: widget.favouritemeal.length,
    );
    }
  }
}
