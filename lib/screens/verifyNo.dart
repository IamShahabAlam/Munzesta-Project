

// **********************

// NOT IN USE 

// **********************






import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ms_project/components/otpCard.dart';
import 'package:ms_project/screens/afterVerify.dart';
import 'package:ms_project/screens/otpScreen.dart';


class VerifyNo extends StatefulWidget {
  @override
  _VerifyNoState createState() => _VerifyNoState();
}

class _VerifyNoState extends State<VerifyNo> {
    
    FirebaseAuth auth = FirebaseAuth.instance;

    final numController = TextEditingController();
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

                
                       OTPCard(
                      title: "Verify Your Number",
                      details: "We will send an One Time Password on this mobile number." , 
                      path: "assets/no.png" , 
                      textFieldIcon: Icons.lock,
                      textFieldName: "Mobile Number",
                      // prefixText: " 🇵🇰 (+92) ",
                      controller: numController ,
                      btnText: "Send"  ,
                      
                      onpressed: () async {
                        setState(() {
                            showLoading = true ;
                             });

                        await _auth.verifyPhoneNumber(
                          phoneNumber: numController.text, 
                          verificationCompleted: (PhoneAuthCredential) async {
                            setState(() {
                                showLoading = false ;                          
                                     });
                          }, 
                          verificationFailed: (verificationFailed) async {
                            setState(() {
                                showLoading = false ;
                              });
                          }, 
                          codeSent: (verificationId , resendingToken) async {
                            setState(() {
                                showLoading = false;
                                this.verificationId = verificationId;
                                                        });
                          }, 
                          codeAutoRetrievalTimeout: (verificationId) async {}
                          );

                          Navigator.push(context, MaterialPageRoute(builder: (context)=> OtpScreen()));
                      },
                     ),
                     
   

              ],),
          ),
        ),
      ),
    );
  }
}
