import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_cook_book/screenUI/home.dart';
import 'package:my_cook_book/utiles/button.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class add extends StatefulWidget {
  const add({super.key});

  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
  TextEditingController _thingnameTextController=TextEditingController();
  TextEditingController _priceTextController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

  Column(
        
        children:[
        
         SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextField(
                controller: _thingnameTextController,
                decoration: const InputDecoration(hintText: 'Thing Name'),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextField(
                controller: _priceTextController,
                decoration: const InputDecoration(hintText: 'Price'),
              ),
            ),
              firebaseUIButton(context,"add",(){
          creatething();
          Navigator.push(context, MaterialPageRoute(builder: (context) => 
          home()
          
          ,));
      
        }
        ),
        ]

      )



    );
  }
  
  void creatething() async {
    User? user = await FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance
        .collection("Things")
        .doc(user!.uid)
        .set({
      "name": _thingnameTextController.text,
      "price": _priceTextController.text,
     
});
  }
}