import 'package:flutter/material.dart';

class storeHome extends StatelessWidget{
  const storeHome({super.key});
  @override
  Widget build(BuildContext context){
      return Container(
        child: Scaffold(
          appBar: AppBar(
            leading: const Icon(Icons.menu, color: Colors.black),
            actions: const [Icon(Icons.shopping_cart_outlined,color: Colors.black)],
          ),
          body: const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(2),
              child: Column(children: [
                //Aquí van todos los widgets que van a aparecer en Home
                Text('HelloWorld')
              ]),
            ),
          ),
        ),
      );
  }
}