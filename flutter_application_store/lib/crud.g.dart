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
      fields[6] == null ? 'Nueces' : fields[6] as String,
      fields[7] == null ? 'Ninguno' : fields[7] as String,
      fields[8] == null ? 'none' : fields[8] as String,
      fields[9] == null
          ? 'https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/ras/Assets/FE0D3777-CA9C-4559-A163-7AEB639F39BA/Derivates/5D8A55BF-8D7A-4E9A-8171-7E7592C1665F.jpg'
          : fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProductList obj) {
    writer
      ..writeByte(10)
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
      ..write(obj.calories)
      ..writeByte(6)
      ..write(obj.category)
      ..writeByte(7)
      ..write(obj.aditives)
      ..writeByte(8)
      ..write(obj.vitamins)
      ..writeByte(9)
      ..write(obj.img_url);
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
