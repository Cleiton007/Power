import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Icon icone;
  final Color color;

  const Category({
    required this.id,
    required this.title,
    required this.icone,
    this.color = const Color.fromARGB(255, 28, 28, 34),
  });
}
