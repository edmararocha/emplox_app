import 'package:flutter/material.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({ Key? key, required this.route }) : super(key: key);

  final String route;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, route);
        }, 
        
        child: Icon(Icons.arrow_back, color: Colors.black87, size: 25,),
        
        style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            onPrimary: Colors.white70,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            minimumSize: Size(20, 45),
          ),
      ),
    );
  }
}