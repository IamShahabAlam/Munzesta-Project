
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ms_project/screens/home.dart';
import 'package:ms_project/screens/phoneVerify.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  FirebaseAuth _auth;

  User _user;

  bool isLoading = true;



  @override

  void initState(){
    super.initState();
    _auth = FirebaseAuth.instance;
    _user = _auth.currentUser;
    isLoading = false;
  }

    final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
      return   FutureBuilder(
        future: _initialization,
        builder: (context,snapshot){
          if (snapshot.hasError){
            return   Center(
              child: Text("Error Found !"),
            );
        }

         else if (snapshot.connectionState == ConnectionState.done){
           return MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home:   AnimatedSplashScreen(
          splash: Column(
            children: [
              Image.asset("assets/sslogo.png",),
              // Text("BELIEVE IN YOURSELF", style: TextStyle(color: Colors.black),),
            ],
          ),
          backgroundColor: Colors.white ,
          animationDuration: Duration(seconds: 1),
          splashIconSize: 200,
          splashTransition: SplashTransition.fadeTransition,
          // duration: 60,
          // pageTransitionType: PageTransitionType.fade,
          



          nextScreen: Home(),
          ), 
          );
         }
         return Container(child: Text("WAIT! Loading..."),);
        }
         ); 
  }
}
     
  


                        //  Color(0xFF0F0858)
                        //  Color(0xFF941B50)