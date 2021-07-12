import 'package:flutter/material.dart';
import 'package:food_app/model/meals.dart';
import 'category_mealitem.dart';

class CategoryMealsScreen extends StatefulWidget {
  final List<Meal> filteredmeal;
  static const routeName = '/category-meals';

  CategoryMealsScreen(this.filteredmeal);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categorytitle;
  late List<Meal> displayedmeal;

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    categorytitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final screencolor = routeArgs["color"];
    displayedmeal = widget.filteredmeal.where((element) {
      return element.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removemeal(String id) {
    setState(() {
      displayedmeal.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: screencolor,
      appBar: AppBar(
        title: Text(categorytitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return CategoryMealItem(
            ingredients: displayedmeal[index].ingredients,
            id: displayedmeal[index].id,
            imagetitle: displayedmeal[index].title,
            imageurl: displayedmeal[index].imageUrl,
            mealaffordability: displayedmeal[index].affordability,
            mealduration: displayedmeal[index].duration,
            mealcomplexity: displayedmeal[index].complexity,
           
          );
        },
        itemCount: displayedmeal.length,
      ),
    );
  }
}
