import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'main.dart';

class CategoryAdapter extends TypeAdapter<Category> {
  @override
  final int typeId = 1;

  @override
  Category read(BinaryReader reader) {
    // Not used because Category is const list, but adapter required for registration.
    return const Category(
        icon: Icons.category, color: Colors.blueGrey, name: 'Other');
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    // No need to write category in this app
  }
}
