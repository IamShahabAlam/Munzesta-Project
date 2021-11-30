import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login.dart';

class AfterLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    void logout() async{
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore db = FirebaseFirestore.instance;
        try {
                  await FirebaseAuth.instance.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
        } catch (e) {
        }
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [

            Column( 
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment : CrossAxisAlignment.start,
              children: [
                Container(
                  height: 330, 
                  margin: EdgeInsets.only(left:10, right: 10),
                  decoration: BoxDecoration(
                    image: DecorationImage( 
                  image: AssetImage("assets/illusLogin.png") ))
                  ,),


                  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
                        child: Text("Hi User!" ,style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),),
                      ),

                      Container( margin: EdgeInsets.only(left:20, right: 20, ),
                        child: 
                        Text("You have successfully logged in our App. This is app is entirely Built on Flutter with the integration of FireBase.",style: TextStyle(height: 1.5 ,fontSize: 16,  color: Colors.grey[700]),
                        )),

                        

                        Container( width: double.infinity , height: 20,
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(200) , topRight: Radius.circular(200) ),
                          // color: Color(0xff570B8F),
                          gradient: LinearGradient(colors: [Color(0xff570B8F), Colors.purple])
                          // shape: BoxShape.
                        ),)
              ],
            ),

         TextButton(onPressed: logout, child: Column(
         children: [
           Icon(Icons.logout,size: 35, color:Color(0xff570B8F) ,),
           Text("LOGOUT" , style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color:Color(0xff570B8F),  ),)
         ],
         )),

          ],
        ),
      )  ,
    );
  }
}