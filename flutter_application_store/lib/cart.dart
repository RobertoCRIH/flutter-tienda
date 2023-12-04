import 'package:flutter/material.dart';
import 'package:flutter_application_store/crud.dart';
import 'package:flutter_application_store/crud_service.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';



class Cart extends StatelessWidget{
  final CrudService _crudService = CrudService();
  
  @override
  

  Widget build(BuildContext context){
      
      return MaterialApp(
        title: 'Cart',
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: _crudService.getAllProducts(), 
          builder: (context,AsyncSnapshot<List<ProductList>> snapshot){
            if(snapshot.connectionState== ConnectionState.done){
              return ProductPageList(snapshot.data??[]);
            }
            return CircularProgressIndicator();
          },),
      );
  }
}

class ProductPageList extends StatefulWidget{
  final List<ProductList> products;

  ProductPageList(this.products);

  @override
  _ProductPageListState createState() => _ProductPageListState();
}

class _ProductPageListState extends State<ProductPageList>{
  final CrudService _crudService = CrudService();


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:  Colors.grey[900],
      appBar: AppBar(
        leading: Icon(Icons.shopping_bag),
        title: const Text('Your Cart'),
        backgroundColor: Colors.grey[900],
      ),
      
      bottomNavigationBar: BottomAppBar(child: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(onPressed: (){
              
            }, child: Text('Buy Now',style: TextStyle(fontSize: 18,color: Colors.amber[900]),))
          ],
        ),
      )),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<ProductList>('products_box').listenable(),
        builder: (context,Box<ProductList> box,_){
          return ListView.builder(
            itemCount: box.values.length,
            itemBuilder: (context,index){
              var prod = box.getAt(index);
              return Visibility( child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                children: [
                  Image.network(prod!.img_url,
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return Text('N/A');
                    },
                    width: 75,
                  ),
                  Text(prod!.title,style: TextStyle(fontSize: 18, color: Colors.white),),
                  Text("\$" + prod.price.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.white),),
                  IconButton(onPressed: (){
                    _crudService.updateProductInCart(index, prod);
                  }, icon: Icon(Icons.delete,color: Colors.white,))
                ],
              ),visible: prod.inCart,);
            },
          );
        },
      ),
      
    );
  }
}