import 'package:flutter/material.dart';

class AddToCart extends StatelessWidget{
  const AddToCart({super.key});
  @override
  Widget build(BuildContext context){
      return Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30)),
        child: Column(children: [
          Text('Dried Apricot',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Quantity 350g',style: TextStyle(fontSize: 16),),
              Text('\$950.00',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: (){},child: Text('Add To Cart',style: TextStyle(fontSize: 18,color: Colors.black),),style: TextButton.styleFrom(padding: EdgeInsets.fromLTRB(45, 5, 45, 5),backgroundColor: Colors.amber[200])),
              Icon(Icons.favorite,color: Colors.red[400],)
            ],
          ),
          
          
        ]),
      
      );

  }
}