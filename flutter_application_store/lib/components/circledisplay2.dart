import 'package:flutter/material.dart';


class CircleDisplay2 extends StatelessWidget{
  const CircleDisplay2({super.key});
  @override
  Widget build(BuildContext context){
      return Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.all(50),
        width:  MediaQuery.of(context).size.width,
        height:  MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.purple[100],
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width)
        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(backgroundImage: AssetImage('assets/fruit.jpeg'),radius: 50,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Buy Fruits',style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                
                Text('\$49.00',style: TextStyle(color: Colors.white, fontSize: 20),),
                Text(' Rating: 4.5 / 5',style: TextStyle(color: Colors.white, fontSize: 16)),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, '/Frutas');
                }, child: Row(children: [Icon(Icons.shopping_cart),Text('Go to Category',style: TextStyle(fontSize: 22),)],))
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
