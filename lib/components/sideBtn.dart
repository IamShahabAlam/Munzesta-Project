import 'package:flutter/material.dart';


class SideBtn extends StatelessWidget {

  SideBtn({this.color,this.text,this.height,this.page});
  final String text;
  final Color color;
  final double height;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Positioned(top: MediaQuery.of(context).size.height*height,
      child: Container( height: 30, width: 77, 
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(topRight: Radius.circular(20) , bottomRight: Radius.circular(20) )
      ),
        child: Align( alignment: Alignment.centerLeft,
          child: ElevatedButton(onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => page )); }, child: Text(text),
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  onPrimary: Colors.white70,
                  elevation: 0,
                ),
          ),
        )),);
  }
}
