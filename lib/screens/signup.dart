import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ms_project/components/formBtn.dart';
import 'package:ms_project/components/inputField.dart';
import 'package:ms_project/components/sideBtn.dart';
import 'package:ms_project/components/socialBtn.dart';
import 'package:ms_project/screens/afterVerify.dart';
import 'package:ms_project/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ms_project/screens/phoneVerify.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cPasswordController = TextEditingController();


  void signup() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore db = FirebaseFirestore.instance;

    final String username = usernameController.text;
    final String email = emailController.text;
    final String password = passwordController.text;
    final String cpassword = cPasswordController.text;

    try {
      final UserCredential user = await auth.createUserWithEmailAndPassword(email: email, password: password);
    
      await db.collection("users").doc(user.user.uid).set({"Email" : email, "Username" : username});
   
      print("email : " + email);
      print("username : " + username);
      
      Navigator.push(context, MaterialPageRoute(builder: (context)=>AfterVerify()));

      print("****User is Registered****");
    } catch (e) {
      print(e.message);
    }

  }

  Widget build(BuildContext context) {
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
                SideBtn(color: Colors.transparent  , text: "Login" , height: 0.25 , page: LoginPage(), ),

//Side Signup Button
                SideBtn(color: Color(0xF9941B50),text: "Signup", height: 0.32, page: SignupPage(),),

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
                             child: Text("SIGN UP", style: TextStyle(fontSize: 20,),)),

                            // SizedBox(height: 5,),
// Username                        
                          InputField(controller: usernameController  ,fieldType: "Username" ,icon: FontAwesomeIcons.user ,keyboardType: TextInputType.name  , hide: false,),                            
// Email
                          InputField(controller: emailController  ,fieldType: "Email" , hide: false , icon: Icons.alternate_email_outlined , keyboardType: TextInputType.emailAddress ,),
//  Password
                          InputField(controller: passwordController ,fieldType: "Password", icon: FontAwesomeIcons.key ,hide: true,),
// Sign Up With Number
                          Container(
                            margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width*0.06, 
                            top: MediaQuery.of(context).size.height*0.03),
                            child: 
                          GestureDetector(
                            onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> PhoneVerify()));},
                            
                            child: Text("SignUp with your Number ?", style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white , 
                              letterSpacing: 1),),
                          ))
  
                        ],),
                    ),


                   
                    

                 
                  ],),

// Signup Button                         
                   FormBtn( onpressed: signup,text: "Sign up", height: 0.84, width: 0.45,),                  

              ],),


          ),
        ),
      ),
    );
  }
}







