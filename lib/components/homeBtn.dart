import 'package:flutter/material.dart';
import 'package:ms_project/screens/login.dart';
import 'package:ms_project/screens/signup.dart';

class HomeSignupBtn extends StatelessWidget {
 
HomeSignupBtn({this.text , this.height, this.width,});

  final String text;
  final double height, width ;  // 0.84 , 0.45

  
  @override
  Widget build(BuildContext context) {
    return Container( height: 38, width: 250, 
      margin: EdgeInsets.only(
             left: MediaQuery.of(context).size.width*width , 
             top: MediaQuery.of(context).size.height*height),
     decoration: BoxDecoration(
       gradient: LinearGradient(colors: [Color(0xFF0F0858),Color(0xFF941B50)]),
       borderRadius: BorderRadius.circular(20),
       boxShadow: [BoxShadow(blurRadius:5,color: Colors.black45, spreadRadius: 2, offset: Offset(0, 2) )]
     ),
      child: ElevatedButton(onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) =>SignupPage()));}, child: Text(text,),
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(fontSize: 18),
        primary: Colors.transparent, 
       //  onPrimary: Colors.black,
        elevation: 0,
        shape: StadiumBorder(),
        
      ),
      ),
           );
  }
}

// =====================================================


class HomeSigninBtn extends StatelessWidget {
 
HomeSigninBtn({this.text , this.height, this.width,});

  final String text;
  final double height, width ;  // 0.84 , 0.45

  
  @override
  Widget build(BuildContext context) {
    return Container( height: 38, width: 250, 
      margin: EdgeInsets.only(
             left: MediaQuery.of(context).size.width*width , 
             top: MediaQuery.of(context).size.height*height),
     decoration: BoxDecoration( 
       color: Colors.white,
      //  gradient: LinearGradient(colors: [Colors.white]),
       borderRadius: BorderRadius.circular(20),
       boxShadow: [BoxShadow(blurRadius: 5 ,color: Colors.black45, spreadRadius: 1 , offset: Offset(0, 2) )]
     ),
      child: ElevatedButton(onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginPage()));}, child: Text(text,),
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(fontSize: 18, color: Color(0xFF0F0858)),
        primary: Colors.transparent, 
        onPrimary: Color(0xFF0F0858),
        elevation: 0,
        shape: StadiumBorder(),
        
      ),
      ),
           );
  }
}