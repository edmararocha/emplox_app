import 'package:flutter/material.dart';

class FieldForm extends StatelessWidget {
  const FieldForm({ Key? key, required this.labelText, required this.controller, required this.pwd, this.errorText}) : super(key: key);
  
  final TextEditingController controller;
  final String labelText;
  final String? errorText;
  final bool pwd;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.white),
      controller: controller,
      obscureText: pwd,
      decoration: InputDecoration(
        labelText: labelText,
        errorText: errorText,
        labelStyle: const TextStyle(color: Colors.white70),
        fillColor: Colors.white,
        border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}