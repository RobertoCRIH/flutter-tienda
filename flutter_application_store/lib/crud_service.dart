import 'dart:ffi';

import 'package:flutter_application_store/crud.dart';
import 'package:hive/hive.dart';

class CrudService{
  final String _boxName = "products_box";

  Future<Box<ProductList>> get _box async => await Hive.openBox<ProductList>(_boxName);

  Future<void> addItem(ProductList productList) async{

    var box = await _box;

    await box.add(productList);

  }
  Future<List<ProductList>> getAllProducts() async {
    var box = await _box;
    return box.values.toList();
  }

  Future<void> deleteProduct(int index) async {
    var box = await _box;
    await box.deleteAt(index);
  }

  Future<void> updateProductInCart(int index,ProductList productList)async{
    var box = await _box;
    productList.inCart = !productList.inCart;
    await box.putAt(index, productList);

  }
}