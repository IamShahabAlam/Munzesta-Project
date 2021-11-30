import 'package:flutter/material.dart';


class FormBtn extends StatelessWidget {
 
 FormBtn({this.text , this.height, this.width,this.onpressed});

  final String text;
  final double height, width ;  // 0.84 , 0.45
  final Function onpressed;
  
  @override
  Widget build(BuildContext context) {
    return Container( height: 38, width: 150, 
      margin: EdgeInsets.only(
             left: MediaQuery.of(context).size.width*width , 
             top: MediaQuery.of(context).size.height*height),
     decoration: BoxDecoration(
       gradient: LinearGradient(colors: [Color(0xFF941B50),Color(0xFF0F0858),Color(0xFF941B50)]),
       borderRadius: BorderRadius.circular(20),
       boxShadow: [BoxShadow(blurRadius:12,color: Colors.black45, spreadRadius: 5 )]
     ),
      child: ElevatedButton(onPressed: onpressed , child: Text(text,style: TextStyle(fontSize: 18,color: Colors.white),),
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(fontSize: 18,color: Colors.white),
        primary: Colors.transparent, 
       //  onPrimary: Colors.black,
        elevation: 0,
        shape: StadiumBorder(),
        
      ),
      ),
           );
  }
}