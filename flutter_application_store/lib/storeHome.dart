import 'package:flutter/material.dart';
import 'package:flutter_application_store/components/circledisplay.dart';
import 'package:flutter_application_store/components/homecarrusel.dart';
import 'package:flutter_application_store/components/productslider.dart';
import 'package:flutter_application_store/components/userheader.dart';

class storeHome extends StatelessWidget{
  const storeHome({super.key});
  @override
  Widget build(BuildContext context){
      
      return Container(
        child: Scaffold(
          appBar: AppBar(
            leading: const Icon(Icons.menu, color: Colors.black),
            actions: <Widget>[
              IconButton(onPressed: (){
                Navigator.pushNamed(context, '/Crud');
              }, icon: Icon(Icons.shopping_bag))
            ],
          ),
          body: const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                //Aquí van todos los widgets que van a aparecer en Home
                
                UserHeader(),
                ProductSlider(),
                CircleDisplay(),
                carrusel()
              ]),
            ),
          ),
        ),
      );
  }
}

