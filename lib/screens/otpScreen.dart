

// **********************

// NOT IN USE 

// **********************






import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ms_project/components/formBtn.dart';

import 'afterVerify.dart';

class OtpScreen extends StatefulWidget {
  
  // OtpScreen({this.phone});
  
  // final String phone;


  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

    //  FirebaseAuth auth = FirebaseAuth.instance;

    // final numController = TextEditingController();
    final otpController = TextEditingController();

    FirebaseAuth _auth = FirebaseAuth.instance;
    String verificationId;
    bool showLoading = false ;

    void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
        setState(() {
            showLoading = true ;
                });

         try {
           final authCredential = await _auth.signInWithCredential(phoneAuthCredential);

           setState(() {
              showLoading = false ;
                      });

            if (authCredential?.user != null) {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AfterVerify() ));
            }          
         } on FirebaseAuthException catch (e) {
           print('Failed with error code: ${e.code}');
          print(e.message);
           setState(() {
                 showLoading = false ;
                      });
         }       
      }

    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container( 
            height: MediaQuery.of(context).size.height, 
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(image: DecorationImage(image: 
            AssetImage("assets/bg.png"), fit: BoxFit.cover),),
            child: Stack(
              children: [
                 Positioned( bottom: MediaQuery.of(context).size.height*0.78,
                   child: 
                  //  Image.asset("assets/logoff.png",height: 150 , width:200 ,),

                  Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left:20),
                          height: 150, width: 200 ,
                          decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.contain ,alignment: Alignment.topLeft,image: AssetImage("assets/logoff.png"),)),),
                   ),

// OTP CARD HERE


                Container(
      margin: EdgeInsets.only(left:25, right: 25, top: MediaQuery.of(context).size.height*0.26),
      height: MediaQuery.of(context).size.height*0.55,
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

            Text( "OTP Verification" ,style: TextStyle(
                 color: Colors.black ,fontSize: 23,fontWeight: FontWeight.bold),),
            Image.asset("assets/otp2.png", height: 45, width: 45,),
                  
            ],),
       
      
      Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text("We have sent you an One Time Password on the number.", style: TextStyle(fontSize: 15 ,color: Colors.grey[700]), textAlign: TextAlign.center,),
      ),

      // Text("We have sent you an One Time Password on this (+92) ${widget.phone} number.", style: TextStyle(fontSize: 15 ,color: Colors.grey[700]), textAlign: TextAlign.center,),

    Column(
      children: [
 
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Container(
            margin: EdgeInsets.only(left: 30,top: 25),
            child: Text("OTP Code",style: TextStyle( fontSize: 15,color: Colors.blue[900]),),),
          Container( margin: EdgeInsets.only(right: 30,top: 5),
            child: Icon(FontAwesomeIcons.key, size: 20,color: Colors.blue[900]),)
        ],),
       
    
    
    Container( 
      height: MediaQuery.of(context).size.height*0.08, 
      width: MediaQuery.of(context).size.width*0.72,
      margin: EdgeInsets.only(top: 8),
      child: TextField(
      style: TextStyle(color: Colors.black),
      controller: otpController,
      ),
     
        ),
      

       ],
    ),



// Login Button       
                  
      FormBtn( 
      text: "Verify",height: 0.05, width: 0.0,
      onpressed: () async {
            PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
                    verificationId: verificationId, smsCode: otpController.text);

            signInWithPhoneAuthCredential(phoneAuthCredential);
          },
      ), 
    ],),
    
    ),

              ],),
          ),
        ),
      ),
    );
  }
}
