import 'package:flutter/material.dart';
import 'package:ms_project/components/homeBtn.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffcfaff),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column( 
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                
                Center(
                  child: Container( height: 320, 
                    margin: EdgeInsets.only(left:10 , right: 10),
                    decoration: BoxDecoration( 
                      image: DecorationImage(image: AssetImage("assets/illus4.png"))
                    ),),
                ),

                  Padding( 
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: 
                    Text("Welcome!" ,style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),),
                  ),

                  Container( 
                    margin: EdgeInsets.only(left:20, right: 20 ,top: 10
                    ),
                    child: 
                    Text("Lets Get started by registering yourself to us. Already got registered, feel free to Login.",style: TextStyle(height: 1.5 ,fontSize: 16,  color: Colors.grey[700]),
                    )),
//SignUp Button        
                  Center(child: HomeSignupBtn(height: 0.05 , width: 0 ,  text: "Sign up" , )),

// Sign IN Button
                  Padding(
                    padding: const EdgeInsets.only(bottom:25.0),
                    child: Center(child: HomeSigninBtn(text: "Log in", height: 0.03, width: 0,)),
                  ),
                  
                  
            ],
            ),
        ),
      ),
    );
  }
}