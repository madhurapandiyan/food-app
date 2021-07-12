import 'package:flutter/material.dart';
import '/model/dummy_data.dart';

class MealDetail extends StatefulWidget {
  static const routeName = "/meal_detail";
  final Function addfavoritemeal;
  final Function addthisfavorite;
  MealDetail(this.addfavoritemeal, this.addthisfavorite);

  @override
  _MealDetailState createState() => _MealDetailState();
}

class _MealDetailState extends State<MealDetail> {
  Widget buildsubtitle(String text) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget build(BuildContext context) {
    final routearg =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    final selectedmeal =
        DUMMY_MEALS.firstWhere((element) => element.id == routearg[1]);
    //final title = routearg[0];
    //final id = routearg[1];
    //final url = routearg[2];
    //final Duration = routearg[3];
    //final Affordability = routearg[4];
    //final Complexity = routearg[5];
    //final ingredi = routearg[6];

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedmeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(),
                child: Image.network(selectedmeal.imageUrl)),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            buildsubtitle("Ingredients"),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 200,
              width: 300,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text("${index + 1}"),
                    ),
                    title: Text(selectedmeal.ingredients[index]),
                  );
                },
                itemCount: selectedmeal.ingredients.length,
              ),
            ),
            buildsubtitle("Steps"),
            Container(
              height: 200,
              width: 300,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text("${index + 1}"),
                    ),
                    title: Text(selectedmeal.steps[index]),
                  );
                },
                itemCount: selectedmeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(widget.addthisfavorite(selectedmeal.id)
              ? Icons.favorite
              : Icons.favorite_border),
          onPressed: () {
            widget.addfavoritemeal(selectedmeal.id);
          }),
    );
  }
}
