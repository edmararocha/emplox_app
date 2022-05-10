// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '''Gerencie Seus \n Funcionários Com \n Apenas Alguns Toques''',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
              Container(height: 40,),
              const Text(
                '''Vamos Simplificar o Seu \n Jeito de Gerenciar Pessoas''',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              Container(height: 67,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/register_form');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(21.0),
                      child: Text("Registre-Se", style: TextStyle(fontSize: 16)),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.black87,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0), bottomLeft: Radius.circular(8.0), topRight: Radius.zero, bottomRight: Radius.zero)),
                        minimumSize: Size(141, 52),
                    ),
                  ), 

                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login_form');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(21.0),
                      child: Text("Login", style: TextStyle(color: Colors.black87, fontSize: 16),),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white70,
                      onPrimary: Colors.black87,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.zero, bottomLeft: Radius.zero, topRight: Radius.circular(8.0), bottomRight: Radius.circular(8.0))),
                      minimumSize: Size(141, 52),
                    ),
                  ), 
                ],
              )
            ],
          ),
        ),
      ),
      
    );
  }
}