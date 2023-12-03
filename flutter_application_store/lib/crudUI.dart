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
  final TextEditingController _controller_desc = TextEditingController();
  final TextEditingController _controller_price = TextEditingController();
  final TextEditingController _controller_ranking = TextEditingController();
  final TextEditingController _controller_cal = TextEditingController();

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
                subtitle: Column(children: [
                  Text(prod.desc),
                  Text("\$"+prod.price.toString()),
                  Text("RANKING: "+prod.ranking.toString()),
                  Text('Calorias: '+prod.calories)
                ]),
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
              content: 
              Column(children: [
                TextField(
                  decoration: InputDecoration(hintText: 'Nombre del Producto'),
                  controller: _controller,
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Descripción del producto'),
                  controller: _controller_desc,
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Price'),
                  keyboardType: TextInputType.number,
                  controller: _controller_price,
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Calificación Del Prducto'),
                  controller: _controller_ranking,
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Calorias'),
                  controller: _controller_cal,
                )
              ],),
              
              actions: [
                ElevatedButton(
                  child: Text('Add'),
                  onPressed: (){
                    if(_controller.text.isNotEmpty){
                      var prod = ProductList(_controller.text, false, int.parse(_controller_price.text), int.parse(_controller_ranking.text), _controller_desc.text, _controller_cal.text);
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