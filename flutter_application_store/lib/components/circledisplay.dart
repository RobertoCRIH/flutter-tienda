import 'package:flutter/material.dart';


class CircleDisplay extends StatelessWidget{
  const CircleDisplay({super.key});
  @override
  Widget build(BuildContext context){
      return Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.all(50),
        width:  MediaQuery.of(context).size.width,
        height:  MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.amber[800],
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width)
        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/bag.png'), width: 150,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Dried Apricots',style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                
                Text('\$49.00',style: TextStyle(color: Colors.white, fontSize: 20),),
                Text(' Rating: 4.5 / 5',style: TextStyle(color: Colors.white, fontSize: 16)),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, '/ProductPage');
                }, child: Row(children: [Icon(Icons.shopping_cart),Text('Add to Cart',style: TextStyle(fontSize: 22),)],))
              ],
            ),
            CircleAvatar(
                radius: 25,
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
                child: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: const Color.fromARGB(255, 255, 0, 0),
                  ),
                  onPressed: () {},
                ),
              ),
          ],
        ),
      );
  }
}
