import 'package:flutter/material.dart';

class carrusel extends StatelessWidget{
  const carrusel({super.key});
  @override
  Widget build(BuildContext context){
      return Container(
        margin: EdgeInsets.only(top: 25,bottom: 25),
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          scrollDirection: Axis.horizontal,
          
          child: Row(children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[250],
              child: TextButton(child: Image(image: AssetImage('assets/bag.png')), onPressed: () {  },)
            ),
            SizedBox(width: 15,),
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[250],
              child: TextButton(child: Image(image: AssetImage('assets/bag.png')), onPressed: () {  },)
            ),
            SizedBox(width: 15,),
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[250],
              child: TextButton(child: Image(image: AssetImage('assets/bag.png')), onPressed: () {  },)
            ),
            SizedBox(width: 15,),
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[250],
              child: TextButton(child: Image(image: AssetImage('assets/bag.png')), onPressed: () {  },)
            ),
            SizedBox(width: 15,),
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[250],
              child: TextButton(child: Image(image: AssetImage('assets/bag.png')), onPressed: () {  },)
            ),
            SizedBox(width: 15,),
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[250],
              child: TextButton(child: Image(image: AssetImage('assets/bag.png')), onPressed: () {  },)
            ),
            SizedBox(width: 15,),
          ],)),
      );
  }
}