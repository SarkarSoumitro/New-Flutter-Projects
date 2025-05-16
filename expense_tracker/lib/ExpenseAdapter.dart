import 'package:hive/hive.dart';

import 'main.dart';

class ExpenseAdapter extends TypeAdapter<Expense> {
  @override
  final int typeId = 0; // Unique ID for this adapter (used internally by Hive)

  @override
  Expense read(BinaryReader reader) {
    // Read how many fields (properties) were saved
    final numOfFields = reader.readByte();

    // Read each field with its index, and store them in a map
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    // Create a new Expense object by assigning all saved fields from the map
    return Expense(
      title: fields[0] as String,
      price: fields[1] as double,
      date: fields[2] as DateTime,
      iconCodePoint: fields[3] as int,
      iconFontFamily: fields[4] as String,
      iconFontPackage: fields[5] as String?,
      colorValue: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Expense obj) {
    // Save the number of fields that will be written (7 here)
    writer.writeByte(7);

    // Save each field with its index, then the value
    writer
      ..writeByte(0) // field index
      ..write(obj.title) // field value
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.iconCodePoint)
      ..writeByte(4)
      ..write(obj.iconFontFamily)
      ..writeByte(5)
      ..write(obj.iconFontPackage)
      ..writeByte(6)
      ..write(obj.colorValue);
  }
}
