import 'package:flutter/material.dart';

class TextFieldForm extends StatelessWidget {
  const TextFieldForm({ Key? key, required this.labelText, required this.onSaved, required this.validate }) : super(key: key);

  final String labelText;

  final Function onSaved;
  final Function validate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:20.0),
      child: TextFormField(
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
        onSaved: onSaved(),
        validator: validate(),
      ),
    );
  }
}