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

  @HiveField(6,defaultValue: 'Nueces')
  final String category;
  @HiveField(7,defaultValue: 'Ninguno')
  final String aditives;
  @HiveField(8,defaultValue: 'none')
  final String vitamins;
  @HiveField(9,defaultValue: 'https://i.cbc.ca/1.3482678.1457489623!/fileImage/httpImage/homer-simpson.jpg')
  final String img_url;
  ProductList(this.title,this.inCart,this.price,this.ranking,this.desc,this.calories,this.category,this.aditives,this.vitamins,this.img_url);
}