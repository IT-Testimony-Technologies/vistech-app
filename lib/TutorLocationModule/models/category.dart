import 'package:flutter/material.dart';

class Category {
  final String category;
  final IconData categoryIcon;

  Category(this.category, this.categoryIcon);

  static List<Category> categoryList() {
    List<Category> list = [];
    list.add(Category('Courses', Icons.class_));
    list.add(Category('Eshop', Icons.shop));
    list.add(Category('Blog', Icons.newspaper));
    list.add(Category('Events', Icons.place_outlined));
    list.add(Category('Notifications', Icons.add_alert));
    list.add(Category('learn with Ai', Icons.person));
    list.add(Category('Video Conference', Icons.video_call));

    return list;
  }
}
