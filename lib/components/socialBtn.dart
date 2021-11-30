import 'package:flutter/material.dart';

class SocialBtn extends StatelessWidget {
  SocialBtn({this.height,this.path});

  final String path;
  final double height;


  @override
  Widget build(BuildContext context) {
    return Positioned( top: MediaQuery.of(context).size.height*height, left: 15,
      child: GestureDetector( onTap: (){},
        child: Container(height: 45, width: 45,
          decoration: BoxDecoration(image: DecorationImage(
          image: AssetImage(path),
          fit: BoxFit.cover
          )),),
      ),
    );
  }
}