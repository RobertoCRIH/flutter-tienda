import 'package:flutter/material.dart';

class ProductBanner extends StatelessWidget{
  const ProductBanner({super.key});
  @override
  Widget build(BuildContext context){
      return Container(
        
      padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
      child: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            child: Image(image: AssetImage('assets/bag.png'),height: 250,),
          ),
          SizedBox(height: 25,),
          Align(
            alignment: Alignment.centerLeft,
            child: Text('Dried Apricot',style: TextStyle(color: Colors.white,fontSize: 34,),),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Text
              Row(
                
                children: [
                  Text('\$44.00', style: TextStyle(color: Colors.white, fontSize: 18),),
                  Text('  /  ', style: TextStyle(color: Colors.white, fontSize: 18),),
                  Text('Nuts', style: TextStyle(color: Colors.white, fontSize: 18),),
                ],
              ),
              
              //Rating
              Row(
                children: [
                  Icon(Icons.star, color: Colors.white,),
                  Icon(Icons.star, color: Colors.white,),
                  Icon(Icons.star, color: Colors.white,),
                  Icon(Icons.star, color: Colors.white,),
                  Icon(Icons.star_border_outlined, color: Colors.white,),
                ],
              )

            ],
          )


          
      ],)
      
      );

  }
}