import 'package:flutter/material.dart';

class ProductSpecs extends StatelessWidget{
  const ProductSpecs({super.key});
  @override
  Widget build(BuildContext context){
      return Container(
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
                    Text('80',style: TextStyle(color: Colors.white,fontSize: 18),)
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
                    Text('Calories',style: TextStyle(color: Colors.white,fontSize: 18),),
                    Text('80',style: TextStyle(color: Colors.white,fontSize: 18),)
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
                    Text('Calories',style: TextStyle(color: Colors.white,fontSize: 18),),
                    Text('80',style: TextStyle(color: Colors.white,fontSize: 18),)
                ],)
              )
            ],
          )
        ],)
      );

  }
}