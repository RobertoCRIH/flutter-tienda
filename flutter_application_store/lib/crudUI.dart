import 'package:flutter/material.dart';
import 'package:flutter_application_store/crud.dart';
import 'package:flutter_application_store/crud_service.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';



class CrudUI extends StatelessWidget{
  final CrudService _crudService = CrudService();
  
  @override
  

  Widget build(BuildContext context){
      
      return MaterialApp(
        title: 'Hive Crud',
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
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crud'),
        backgroundColor: Colors.black,
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<ProductList>('products_box').listenable(),
        builder: (context,Box<ProductList> box,_){
          return ListView.builder(
            itemCount: box.values.length,
            itemBuilder: (context,index){
              var prod = box.getAt(index);
              return ListTile(
                title: Text(prod!.title),
                leading: Checkbox(
                  value: prod.inCart,
                  onChanged: (val){
                    _crudService.updateProductInCart(index, prod);
                  },
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _crudService.deleteProduct(index);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () async {
          showDialog(context: context, 
          builder: (context){
            return AlertDialog(
              title: Text('Add Item'),
              content: TextField(
                controller: _controller,
              ),
              actions: [
                ElevatedButton(
                  child: Text('Add'),
                  onPressed: (){
                    if(_controller.text.isNotEmpty){
                      var prod = ProductList(_controller.text, false, 500, 5, 'This is a product', '300');
                      _crudService.addItem(prod);
                      _controller.clear();
                      Navigator.pop(context);
                    }
                  },
                  
                )
              ],
            );
          });          
        },
        child: Icon(Icons.add),
      ),
    );
  }
}