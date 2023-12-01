import 'package:flutter/material.dart';

class UserHeader extends StatelessWidget{
  const UserHeader({super.key});
  @override
  Widget build(BuildContext context){
      return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("Hi, Helen.",style: TextStyle(fontSize: 18,)),
          
          Text("What's today's taste? 😙",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
        ]),
      );
  }
}
