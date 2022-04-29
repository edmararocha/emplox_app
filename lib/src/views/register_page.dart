// ignore_for_file: prefer_const_constructors

import 'package:emplox/src/components/button_back.dart';
import 'package:emplox/src/components/submit_button.dart';
import 'package:flutter/material.dart';

import '../login/components/textfield_form.dart';

class RegisterPage extends StatefulWidget {
  const 
  RegisterPage({ Key? key }) : super(key: key);

  @override
  State<
  RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<
RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.black87,
          child: Padding(
            padding: const EdgeInsets.only(right: 40.0,left: 40.0, top: 40.0, bottom: 20.0),
            child: Column(
              children: [
                Container(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ButtonBack(route: "/"),
                    
                    Text(
                      "EMPLOX",
                      style: TextStyle(fontSize: 50, color: Colors.white),
                      )
                  ],
                ),
                Container(height: 50,),
                // TextFieldForm(labelText: 'Nome Do Usuário'),
                // Container(height: 33,),
                // TextFieldForm(labelText: 'E-mail'),
                // Container(height: 33,),
                // TextFieldForm(labelText: 'Senha'),
                Container(height: 52,),
                
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(21.0),
                      child: Text("Registre-Se", style: TextStyle(fontSize: 20)),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.black87,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      minimumSize: Size(272, 51),
                    ),
                  ), 
              ],
            ),
          ),
        ),
    );
  }
}