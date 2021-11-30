import 'package:flutter/material.dart';
import 'formBtn.dart';

class OTPCard extends StatelessWidget {

  OTPCard({this.btnText,this.details,this.path,this.title, this.onpressed,  this.controller,this.textFieldName,this.textFieldIcon});
  
  final String title, path, details, btnText,textFieldName; 
  final Function onpressed;
  final TextEditingController controller;
  final IconData textFieldIcon;

  
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(left:25, right: 25, top: MediaQuery.of(context).size.height*0.22),
      height: MediaQuery.of(context).size.height*0.53,
      width: double.infinity,
      decoration: BoxDecoration(
     //  gradient: LinearGradient(end: Alignment.topRight ,
     //  colors: [Colors.white,Colors.white,Colors.white,Colors.white,Color(0xff941B50),]),
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
      boxShadow: [BoxShadow(color: Colors.black54 , blurRadius: 12,spreadRadius: 3) ,],
      
    ),
    child: Column(children: [
     
     SizedBox(height: 20,),
      
        Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Text( title ,style: TextStyle(
                 color: Colors.black ,fontSize: 23,fontWeight: FontWeight.bold),),
            Image.asset(path, height: 45, width: 45,),
                  
            ],),
       
      
      Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text(details, style: TextStyle(fontSize: 15 ,color: Colors.grey[700]), textAlign: TextAlign.center,),
      ),

//TEXTFIELD HERE
      // InputField(fieldType: "mobile number" , hide: false, icon: Icons.mobile_friendly, keyboardType: TextInputType.number,),
 
    Column(
      children: [
 
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Container(
            margin: EdgeInsets.only(left: 30,top: 15),
            child: Text(textFieldName,style: TextStyle( fontSize: 15,color: Colors.blue[900]),),),
          Container( margin: EdgeInsets.only(right: 30,top: 15),
            child: Icon(textFieldIcon, size: 20,color: Colors.blue[900]),),
        ],),
          //   height: 35, width: 240,
    Container( height: MediaQuery.of(context).size.height*0.1, width: MediaQuery.of(context).size.width*0.72,
    margin: EdgeInsets.only(top: 8),
      child: Center(
        child: 
        TextField(
          controller: controller,
          maxLength: 13,
          obscureText: false ,
          keyboardType: TextInputType.streetAddress,
          style: TextStyle(letterSpacing: 1.5),


        decoration: InputDecoration(
        //  prefixText: prefixText,
          contentPadding: EdgeInsets.all(15),
          fillColor: Color(0xFf1c2f6c),
          filled: true,
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Color(0xFf1c2f6c) )),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
         ),),
      ),),

      
       ],
    ),



// Login Button       
                  
      FormBtn(onpressed: onpressed ,text: btnText,height: 0.01, width: 0.0,), 

    ],),
    
    );
  }
}