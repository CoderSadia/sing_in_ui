import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ScreenDesign2 extends StatefulWidget {
   ScreenDesign2({super.key, this.email, this.password});

   String ?email; String ?password;
  @override
  State<ScreenDesign2> createState() => _ScreenDesign2State();
}

class _ScreenDesign2State extends State<ScreenDesign2> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${widget.email}"),
      
          Text("${widget.password}"),
      
        ],
      ),
      
    );
  }
}