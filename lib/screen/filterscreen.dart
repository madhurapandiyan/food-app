import 'package:flutter/material.dart';
import 'maindrawer.dart';

class Filterscreen extends StatefulWidget {
  final Function filtered;
  final Map<String, bool> currentfilter;

  static const routename = "mappiy";

  Filterscreen(this.currentfilter, this.filtered);

  @override
  _FilterscreenState createState() => _FilterscreenState();
}

class _FilterscreenState extends State<Filterscreen> {
  bool lactosefree = false;
  bool glutenfree = false;
  bool veganfree = false;
  bool vegetarian = false;

  @override
  void initState() {
    lactosefree = widget.currentfilter["lactose"]!;
    glutenfree = widget.currentfilter["glucton"]!;
   veganfree = widget.currentfilter["vegan"]!;
    vegetarian = widget.currentfilter["vegetarian"]!;
    super.initState();
  }

  Widget filterlist(
    bool type,
    String title,
    String subtitle,
    dynamic set,
  ) {
    return SwitchListTile(
      onChanged: set,
      value: type,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text("Filter"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final userpicked = {
                    "glucton": glutenfree,
                    "vegan": veganfree,
                    "vegetarian": vegetarian,
                    "lactose": lactosefree
                  };
                  widget.filtered(userpicked);
                },
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text("Adjust your meal selection"),
            ),
            Expanded(
                child: ListView(children: [
              filterlist(lactosefree, "Lactose free",
                  "only include lactose free meals", (say) {
                setState(() {
                  lactosefree = say;
                });
              }),
              filterlist(
                  glutenfree, "Glucton free", "only include glucton free meals",
                  (say) {
                setState(() {
                  glutenfree = say;
                });
              }),
              filterlist(
                  veganfree, "Vegan free", "only include vegan free meals",
                  (say) {
                setState(() {
                  veganfree = say;
                });
              }),
              filterlist(vegetarian, "Vegetarian free",
                  "only include vegetarian free meals", (say) {
                setState(() {
                  vegetarian = say;
                });
              })
            ]))
          ],
        ));
  }
}
