import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_cook_book/screenUI/home.dart';
import 'package:my_cook_book/utiles/button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class toshop extends StatefulWidget {
  const toshop({super.key});

  @override
  State<toshop> createState() => _toshopState();
}


class _toshopState extends State<toshop> {
   TextEditingController _thingnameTextController=TextEditingController();
  TextEditingController _priceTextController=TextEditingController();
  
  String name='name';
  String price='price';
  void getData() async {
    User? user = await FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance
        .collection("Things")
        .doc(user!.uid)
        .get();
    setState(() {
      name = vari.data()!['name'];
      price = vari.data()!['price'];
     
    });
  }
  void updateData(String name, String price) async {
    User? user = await FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection("Things")
        .doc(user!.uid) // replace "userId" with the actual document ID
        .update({
      "name": name,

      "price": price,
     
    });
  
  }
    void deleteData() async {
    User? user = await FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('Things')
        .doc(user!.uid)
        .delete();
  }
  void initState(){
    getData();
    super.initState();
  }
 


  @override
  Widget build(BuildContext context) {
    _priceTextController.text=price;
    _thingnameTextController.text=name;
    return Scaffold(
      body:

  Column(
        
        children:[
          Text("Thing Name"),
       
                  SizedBox(
                  height: 20,
                ),

                resuableTextField(
                    name, Icons.person_outline, true, _thingnameTextController),
                const SizedBox(
                  height: 20,
                ),
                 Text("Price"),
                resuableTextField(
                    price, Icons.person_outline, true, _priceTextController),
                const SizedBox(
                  height: 20,
                ),

                firebaseUIButton(
                  context,
                   "Edit",
                  () {
                    updateData(_thingnameTextController.text, _priceTextController.text);

Navigator.push(context, MaterialPageRoute (builder: (context) => home(),) );
                    
                  },
                ),
                firebaseUIButton(
                  context,
                   "Delete",
                  () {
deleteData();
Navigator.push(context, MaterialPageRoute (builder: (context) => home(),) );
                    
                  },
                ),
        ]
        

      )



    );
  }
  
  
}