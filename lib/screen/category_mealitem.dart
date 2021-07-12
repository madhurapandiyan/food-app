import 'package:flutter/material.dart';
import 'package:food_app/model/meals.dart';
import 'package:food_app/screen/meal_detail.dart';

class CategoryMealItem extends StatelessWidget {
  final String id;
  final String imagetitle;
  final String imageurl;
  final int mealduration;
  final Affordability mealaffordability;
  final Complexity mealcomplexity;
  final List<dynamic> ingredients;

  CategoryMealItem({
    required this.ingredients,
    required this.id,
    required this.imagetitle,
    required this.imageurl,
    required this.mealduration,
    required this.mealaffordability,
    required this.mealcomplexity,
  });

  void selectmeal(ctx) {
    Navigator.of(ctx).pushNamed(MealDetail.routeName, arguments: [
      imagetitle,
      id,
      imageurl,
      mealduration,
      mealaffordability,
      mealcomplexity,
      ingredients
    ]);
  }

  String get complexityget {
    switch (mealcomplexity) {
      case Complexity.Simple:
        return "simple";
        // ignore: dead_code
        break;
      case Complexity.Hard:
        return "Hard";
        // ignore: dead_code
        break;
      case Complexity.Challenging:
        return "Challenging";
        // ignore: dead_code
        break;
      default:
        return "Unknown";
    }
  }

  String get affordabilityget {
    switch (mealaffordability) {
      case Affordability.Pricey:
        return "Pricey";
        // ignore: dead_code
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        // ignore: dead_code
        break;
      case Affordability.Affordable:
        return "Affordable";

        // ignore: dead_code
        break;
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectmeal(context),
      splashColor: Colors.white,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        elevation: 10,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                  child: Image.network(imageurl),
                ),
                Positioned(
                  bottom: 20,
                  left: 10,
                  child: Container(
                    width: 350,
                    height: 40,
                    color: Colors.black87.withOpacity(0.1),
                    child: Text(
                      imagetitle,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: double.infinity,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Text("$mealduration min"),
                      Icon(Icons.access_alarm_outlined),
                      SizedBox(
                        width: 6,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(complexityget),
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(affordabilityget),
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
