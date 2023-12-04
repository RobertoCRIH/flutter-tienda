import 'package:flutter/material.dart';

class ProductSlider extends StatelessWidget{
  const ProductSlider({super.key});
  @override
  Widget build(BuildContext context){
      return Container(
        padding: EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Row(
              children: [
                //Este es un objeto del slider

            
            Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/nuts.jpg'),
                ),
                Text('Nuts')
              ],
            ),

            SizedBox(width: 20,),
            //Este es un objeto del slider
            Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/fruit.jpeg'),
                ),
                Text('Dried fruit')
              ],
            ),
              ],
            ),
            
            
            Icon(Icons.search,size: 40,)
          ],
        ),
      );
  }
}
