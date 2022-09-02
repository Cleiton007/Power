import 'package:flutter/material.dart';
import '../components/category_item.dart';
import '../data/dummy_data.dart';

class CategoriesScreens extends StatelessWidget {
  const CategoriesScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(30.0),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 25,
        mainAxisSpacing: 25,
        mainAxisExtent: 110,
      ),
      children: DUMMY_CATEGORIES.map((cat) {
        return CategoyItem(
            category: cat,
        );
      }).toList(),
    );
  }
}
