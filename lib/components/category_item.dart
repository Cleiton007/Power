import 'package:flutter/material.dart';

import '../models/category.dart';
import '../utils/app_routes.dart';

class CategoyItem extends StatelessWidget {
  final Category category;

  const CategoyItem({Key? key, required this.category}) : super(key: key);

  void _selectCategory(BuildContext context) {
    switch (category.id) {
      case "c1":
        Navigator.of(context).pushNamed(
          AppRoutes.ALUNOS_SCREEN,
        );
        break;
      case "c2":
        Navigator.of(context).pushNamed(
          AppRoutes.PAGAMENTOS_SCREEN,
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      borderRadius: BorderRadius.circular(10),
      splashColor: Theme.of(context).colorScheme.primary,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Expanded(
              child: FittedBox(
            child: category.icone,
            fit: BoxFit.fitHeight,
          )),
          Text(category.title, style: Theme.of(context).textTheme.headline6),
        ]),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
