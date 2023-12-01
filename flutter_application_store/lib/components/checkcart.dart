import 'package:flutter/material.dart';

class CheckCart extends StatelessWidget{
  const CheckCart({super.key});
  @override
  Widget build(BuildContext context){
      return Container(
        decoration: BoxDecoration(color: Colors.black),
        margin: EdgeInsets.only(top: 25),
        padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
        child: Column(children: [
          
          Row(
            children: [
              IconButton(onPressed: (){}, icon: Icon( Icons.shopping_cart)),
              SizedBox(width: 25,),
              Text('Check your cart',style: TextStyle(color: Colors.white,fontSize: 18),)
            ],
          )
        ]),
      
      );

  }
}