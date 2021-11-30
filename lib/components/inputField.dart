import 'package:flutter/material.dart';


class InputField extends StatelessWidget {
  
  InputField({this.fieldType,this.icon, this.keyboardType,this.hide, this.controller});
  
  final String fieldType; 
  final IconData icon;
  final TextInputType keyboardType;
  final bool hide;
  final TextEditingController controller;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
 
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Container(
            margin: EdgeInsets.only(left: 30,top: 25),
            child: Text(fieldType,style: TextStyle(color: Colors.white70),),),
          Container( margin: EdgeInsets.only(right: 30,top: 25),
            child: Icon(icon , size: 16,),)
        ],),
          //   height: 35, width: 240,
    Container( height: MediaQuery.of(context).size.height*0.06, width: MediaQuery.of(context).size.width*0.67,
    margin: EdgeInsets.only(left: 12,top: 8),
      child: TextField(
        controller: controller,
        obscureText: hide ,
        keyboardType: keyboardType,
      decoration: InputDecoration(
       
        contentPadding: EdgeInsets.all(10),
        
        fillColor: Color(0xFf1c2f6c),
        filled: true,
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Color(0xFf1c2f6c) )),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
       ),),)
       ],
    );
  }
}