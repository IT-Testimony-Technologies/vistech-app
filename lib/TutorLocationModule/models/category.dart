import 'package:flutter/material.dart';

class Category {
  final String category;
  final IconData categoryIcon;

  Category(this.category, this.categoryIcon);

  static List<Category> categoryList() {
    List<Category> list = [];
    list.add(Category('Piano', Icons.piano_outlined));
    list.add(Category('Guitar', Icons.play_circle_fill));
    list.add(Category('Drums', Icons.view_column_outlined));
    list.add(Category('Violin', Icons.stream_sharp));
    list.add(Category('Flute', Icons.line_axis_outlined));
    list.add(Category('Music Theory', Icons.book));

    return list;
  }
}
