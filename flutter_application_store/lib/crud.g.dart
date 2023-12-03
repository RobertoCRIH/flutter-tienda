// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crud.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductListAdapter extends TypeAdapter<ProductList> {
  @override
  final int typeId = 1;

  @override
  ProductList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductList(
      fields[0] as String,
      fields[1] == null ? false : fields[1] as bool,
      fields[2] == null ? 50 : fields[2] as int,
      fields[3] == null ? 0 : fields[3] as int,
      fields[4] == null ? 'No description' : fields[4] as String,
      fields[5] == null ? '100' : fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProductList obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.inCart)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.ranking)
      ..writeByte(4)
      ..write(obj.desc)
      ..writeByte(5)
      ..write(obj.calories);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
