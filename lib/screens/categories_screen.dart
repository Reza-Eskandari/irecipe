import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("DeliMeal"),
      // ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES.map((catData) {
          return CategoryItem(
            catData.id,
            catData.title,
            catData.color,
            catData.image,
          );
        }).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
