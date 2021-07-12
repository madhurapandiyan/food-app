import 'package:flutter/material.dart';

import '../model/dummy_data.dart';
import 'category_item.dart';

class CategoriesScreen extends StatelessWidget {
  static const routename = "machi";
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoryItem(
                catData.id,
                catData.title,
                catData.color,
              ),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 7 / 6,
          crossAxisSpacing: 20,
          mainAxisSpacing: 40,
        ));
  }
}
