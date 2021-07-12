import 'package:flutter/material.dart';

import 'filterscreen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildlisttile(String text, Icon icon, VoidCallback ontap) {
    return ListTile(
        leading: icon,
        title: Text(
          text,
          style: TextStyle(
              fontFamily: "Raleway", fontWeight: FontWeight.bold, fontSize: 20),
        ),
        onTap: ontap);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.all(10),
      child: Drawer(
        child: Container(
            //margin: EdgeInsets.all(10),
            child: Column(
          children: [
            Container(
                height: 100,
                width: double.infinity,
                color: Theme.of(context).primaryColor,
                child: DrawerHeader(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        "mappiy",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ))),
            SizedBox(
              height: 20,
            ),
            buildlisttile("Meal", Icon(Icons.restaurant),
                () => Navigator.of(context).pushNamed("/")),
            buildlisttile(
                "Filter",
                Icon(Icons.filter),
                () => Navigator.of(context)
                    .pushReplacementNamed(Filterscreen.routename)),
          ],
        )),
      ),
    );
  }
}
