// ignore_for_file: prefer_const_constructors

import 'package:emplox/src/components/button_back.dart';
import 'package:flutter/material.dart';

import '../presenters/LoginPresenter.dart';
import '../repositories/login_repository.dart';

class LoginFormPage extends StatefulWidget {
  const LoginFormPage({ Key? key }) : super(key: key);

  @override
  State<LoginFormPage> createState() => _LoginFormPageState();
}

class _LoginFormPageState extends State<LoginFormPage> implements LoginContract {

  late LoginPresenter presenter;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    presenter = LoginPresenter(LoginRepository(), this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void loginManangement() {
    setState(() {});
  }

  @override
  void loginError() {
   ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Login error"),
        duration: Duration(milliseconds: 2000),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  void loginSuccess() {
    Navigator.of(context).pushReplacementNamed("/home");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black87,
          child: Padding(
            padding: const EdgeInsets.only(right: 40.0,left: 40.0, top: 40.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    ButtonBack(route: "/"),
                    Text(
                      "EMPLOX",
                      style: TextStyle(fontSize: 50, color: Colors.white),
                      )
                  ],
                ),
                Container(height: 70,),

                Form(
                  key: presenter.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: const TextStyle(color: Colors.white70),
                          border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                        onSaved: (value) {
                            presenter.userEmail(value!);
                        },
                        validator: (value) {
                           if (value!.isEmpty) {
                            return 'Campo não pode ser vazio';
                          } else if (!value.contains("@")) {
                            return 'Email não é válido';
                          }   
                        },
                      ),
                      Container(height: 10,),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          labelStyle: const TextStyle(color: Colors.white70),
                          border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                        onSaved: (value) { 
                          presenter.userPassword(value!); 
                        },
                        validator: (value) {
                            if (value!.isEmpty) {
                              return 'Campo não pode ser vazio';
                            }
                          }
                      ),
                      Container(height: 40,)
                    ],
                  ),)
                ),
                ElevatedButton(
                    onPressed: presenter.isLoading ? null : presenter.loginManangement,
                    child: Padding(
                      padding: const EdgeInsets.all(21.0),
                      child: Text("Entrar", style: TextStyle(fontSize: 20)),
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