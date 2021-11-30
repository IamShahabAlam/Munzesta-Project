
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ms_project/components/formBtn.dart';
import 'package:ms_project/components/inputField.dart';
import 'package:ms_project/components/sideBtn.dart';
import 'package:ms_project/components/socialBtn.dart';
import 'package:ms_project/screens/afterLogin.dart';
import 'package:ms_project/screens/signup.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    


    void login() async{

    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore db = FirebaseFirestore.instance;

    final String email = emailController.text;
    final String password = passwordController.text;

    try  {
      
      final UserCredential user = await auth.signInWithEmailAndPassword(email: email, password: password);
      final DocumentSnapshot snapshot = await db.collection("users").doc(user.user.uid).get();
      final data = snapshot.data();

      print("user ID : " + user.user.uid);
      print("User Email : " + email);

      print("**** USER SUCCESSFULLY LOGGED IN ****");

      Navigator.push(context, MaterialPageRoute(builder: (context) => AfterLogin()));
    
    } catch (e) {
    
      print(e.message);
    }
   }
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container( height: MediaQuery.of(context).size.height,
          width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("assets/bg.png")), ),
            child: Stack(
              
              children: [
                
// LOGO HERE            
                    Positioned(
                        bottom: MediaQuery.of(context).size.height*0.82 ,
                      child: Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left:20),
                        height: 150, width: 200 ,
                        decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.contain ,alignment: Alignment.topLeft,image: AssetImage("assets/logoff.png"),)),),
                    ),

//Side Login Button 
                SideBtn(color: Color(0xF9941B50) , text: "Login" , height: 0.25 , page: LoginPage(),  ),

//Side Signup Button
                SideBtn(color: Colors.transparent,text: "Signup", height: 0.32, page: SignupPage(),),

// Social Media Btns             
                SocialBtn(height: 0.45 , path: "assets/fb.png",),

                SocialBtn(height: 0.55 , path: "assets/wa.png" ,),

                SocialBtn(height: 0.65 , path: "assets/tw.png" ,),
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    

// FORM HERE
                    Container(   margin: EdgeInsets.only(left:90,top: 70), 
                    // alignment: Alignment.centerRight,
                      height: MediaQuery.of(context).size.height*0.75, 
                      width: MediaQuery.of(context).size.width*0.8,
                      // 
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),topLeft: Radius.circular(25)),
                        gradient: LinearGradient( begin: Alignment.topCenter , end: Alignment.bottomLeft,
                        colors: [Color(0xFF0F0858),Color(0xFF0F0858),Color(0xFF0F0858),Color(0xFF941B50)]),
                        boxShadow: [BoxShadow(color: Colors.black54 ,blurRadius: 15,spreadRadius: 1)]
                        ),

                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           
                           Container(margin: EdgeInsets.only(left: 30,top: 40),
                             child: Text("LOGIN", style: TextStyle(fontSize: 20,),)),

                            SizedBox(height: 40,),
// Email
                          InputField(controller: emailController ,fieldType: "Email" , hide: false , icon: Icons.alternate_email_outlined , keyboardType: TextInputType.emailAddress ,),

//  Password
                          InputField(controller: passwordController ,fieldType: "Password", icon: FontAwesomeIcons.key ,hide: false,),
                        
                          Container(  margin: EdgeInsets.only(left: 30,top: 15),
                            child: GestureDetector(child: Text("Forgot Password ?",style: TextStyle(color: Colors.white70),))),
                        
                        ],),
                    ),

           ],),

// Login Button                         
                   FormBtn(onpressed: login ,text: "Login", height: 0.84, width: 0.45,),                  

              ],),


          ),
        ),
      ),
    );
  }
}







