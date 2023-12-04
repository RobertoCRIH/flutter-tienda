import 'package:flutter/material.dart';
import 'package:flutter_application_store/components/addtocart.dart';
import 'package:flutter_application_store/components/checkcart.dart';
import 'package:flutter_application_store/components/productbanner.dart';
import 'package:flutter_application_store/components/productspecs.dart';


class ProductPage extends StatelessWidget{
  const ProductPage({super.key});
  @override
  Widget build(BuildContext context){
      
      return Container(
        child: Scaffold(
          backgroundColor: Colors.amber[800],
          appBar: AppBar(
            leading: const Icon(Icons.shopping_cart_checkout, color: Color.fromARGB(255, 255, 255, 255)),
            actions: <Widget>[
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.cancel_outlined,color: Colors.white,))
            ],
            backgroundColor: Colors.amber[800],
          ),
          body: const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                //Aquí van todos los widgets que van a aparecer en Home
                
                ProductBanner(), 
                ProductSpecs(),
                AddToCart(),
                CheckCart()
              ]),
            ),
          ),
        ),
      );
  }
}