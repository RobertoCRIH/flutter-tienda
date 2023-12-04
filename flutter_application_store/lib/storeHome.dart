import 'package:flutter/material.dart';
import 'package:flutter_application_store/components/circledisplay.dart';
import 'package:flutter_application_store/components/circledisplay2.dart';
import 'package:flutter_application_store/components/homecarrusel.dart';
import 'package:flutter_application_store/components/productslider.dart';
import 'package:flutter_application_store/components/userheader.dart';

class storeHome extends StatefulWidget{
   const storeHome({Key? key}) : super(key: key);
  
  @override
  State<storeHome> createState()=> _storeHome();
}


class _storeHome extends State<storeHome>{
  
  bool nuts = false;

  
  @override
  Widget build(BuildContext context){
      
      return Container(
        child: Scaffold(
          appBar: AppBar(
            leading: const Icon(Icons.menu, color: Colors.black),
            actions: <Widget>[
              IconButton(onPressed: (){
                Navigator.pushNamed(context, '/Cart');
              }, icon: Icon(Icons.shopping_bag))
            ],
          ),
          body:  SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                //Aquí van todos los widgets que van a aparecer en Home
                
                UserHeader(),
                // ProductSlider(),

                
                Container(
                  padding: EdgeInsets.all(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Row(
                        children: [
                          //Este es un objeto del slider

                      ElevatedButton(onPressed: (){
                        setState(() {
                          nuts = true;
                        }); 
                      }, child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage('assets/nuts.jpg'),
                          ),
                          Text('Nuts')
                        ],
                      ),),

                      

                      SizedBox(width: 20,),
                      //Este es un objeto del slider
                      ElevatedButton(onPressed: (){
                        setState(() {
                          nuts = false;
                        }); 
                      }, child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage('assets/fruit.jpeg'),
                          ),
                          Text('Fruits')
                        ],
                      ),),
                        ],
                      ),
                      
                      
                      Icon(Icons.search,size: 40,)
                    ],
                  ),
                ),

                Visibility(child: CircleDisplay(),visible: nuts,),
                Visibility(child: CircleDisplay2(),visible: !nuts,),
                
                carrusel(),

                IconButton(onPressed: (){
                  Navigator.pushNamed(context, '/Crud');
                }, icon: Icon(Icons.save))
              ]),
            ),
          ),
        ),
      );
  }
}

