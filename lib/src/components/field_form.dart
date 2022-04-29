import 'package:flutter/material.dart';

class FieldForm extends StatelessWidget {
  const FieldForm({ Key? key, required this.labelText, required this.controller}) : super(key: key);
  
  final TextEditingController controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white70),
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