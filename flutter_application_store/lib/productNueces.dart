import 'package:flutter/material.dart';
import 'package:flutter_application_store/crud.dart';
import 'package:flutter_application_store/crud_service.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';




class ProductPageNueces extends StatelessWidget{
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
      backgroundColor:  Colors.amber[900],
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
              return Visibility( child: Column(
                children: [
                  //Banner y Header
                  Container(
        
                  padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                  child: Column(
                    
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        child: Image.network(prod!.img_url,
                          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                            return Text('N/A');
                          },
                          width: 75,
                        ),
                      ),
                      SizedBox(height: 25,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(prod.title,style: TextStyle(color: Colors.white,fontSize: 34,),),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Text
                          Row(
                            
                            children: [
                              Text('\$'+prod.price.toString(), style: TextStyle(color: Colors.white, fontSize: 18),),
                              Text('  /  ', style: TextStyle(color: Colors.white, fontSize: 18),),
                              Text(prod.category, style: TextStyle(color: Colors.white, fontSize: 18),),
                            ],
                          ),
                          
                          //Rating
                          Row(
                            children: [
                              RatingBar(
                                initialRating: double.parse(prod.ranking.toString()),
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                ratingWidget: RatingWidget(
                                  full: Icon(Icons.star,color: Colors.white,),
                                  half: Icon(Icons.star_half,color: Colors.white,size: 5,),
                                  empty: Icon(Icons.star_border,color: Colors.white,size: 5,),
                                ),
                                itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ],
                          )

                        ],
                      )


                      
                  ],)
                  
                  ),
                  //Specs
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                    child: Column(children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Capacity',style: TextStyle(color: Colors.white,fontSize: 18),),

                      ),
                      SizedBox(height: 10,),
                      Row(
                        
                        children: [
                          //Objeto de las especificaciones
                          Container(
                            decoration: BoxDecoration(border: Border.all(color: Colors.white,width: 1)),
                            width: 100,
                            height: 100,
                            
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Calories',style: TextStyle(color: Colors.white,fontSize: 18),),
                                Text(prod.calories,style: TextStyle(color: Colors.white,fontSize: 18),)
                            ],)
                          ),
                          SizedBox(width: 20,),
                          Container(
                            decoration: BoxDecoration(border: Border.all(color: Colors.white,width: 1)),
                            width: 100,
                            height: 100,
                            
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Vitamins',style: TextStyle(color: Colors.white,fontSize: 18),),
                                Text(prod.vitamins,style: TextStyle(color: Colors.white,fontSize: 18),)
                            ],)
                          ),
                          SizedBox(width: 20,),
                          Container(
                            decoration: BoxDecoration(border: Border.all(color: Colors.white,width: 1)),
                            width: 100,
                            height: 100,
                            
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Additives',style: TextStyle(color: Colors.white,fontSize: 18),),
                                Text(prod.aditives,style: TextStyle(color: Colors.white,fontSize: 18),)
                            ],)
                          )
                        ],
                      )
                    ],)
                  ),
                  //Add to Cart

                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30)),
                    child: Column(children: [
                      Text(prod.title,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Quantity 350g',style: TextStyle(fontSize: 16),),
                          Text('\$'+prod.price.toString(),style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(onPressed: (){
                            _crudService.updateProductInCart(index, prod);
                            
                          },child: Text('Add To Cart',style: TextStyle(fontSize: 18,color: Colors.black),),style: TextButton.styleFrom(padding: EdgeInsets.fromLTRB(45, 5, 45, 5),backgroundColor: Colors.amber[200])),
                          Icon(Icons.favorite,color: Colors.red[400],)
                        ],
                      ),
                      
                      
                    ]),
                  
                  ),
                  SizedBox(height: 50,)
                ],
              ),
              visible:(prod!.category.toLowerCase() == 'nueces'),);
            },
          );
        },
      ),
      
    );
  }
}