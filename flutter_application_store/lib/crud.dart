import 'dart:ffi';

import 'package:hive/hive.dart';
part 'crud.g.dart';

@HiveType(typeId: 1)

class ProductList{
  @HiveField(0)
  final String title;
  @HiveField(1,defaultValue: false)
  bool inCart;
  @HiveField(2,defaultValue: 50)
  final int price;
  @HiveField(3,defaultValue: 0)
  final int ranking;
  @HiveField(4,defaultValue: 'No description')
  final String desc;
  @HiveField(5,defaultValue: '100')
  final String calories;

  ProductList(this.title,this.inCart,this.price,this.ranking,this.desc,this.calories);
}