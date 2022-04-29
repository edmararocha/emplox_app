import 'package:flutter/material.dart';

import '../components/button_back.dart';
import '../presenters/LoginPresenter.dart';
import '../repositories/login_repository.dart';

class LoginTeste extends StatefulWidget {
  const LoginTeste({ Key? key }) : super(key: key);

  @override
  State<LoginTeste> createState() => _LoginTesteState();
}

class _LoginTesteState extends State<LoginTeste> implements LoginContract {

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
                
                ElevatedButton(
                    onPressed: presenter.isLoading ? null : presenter.loginManangement,
                    child: Padding(
                      padding: const EdgeInsets.all(21.0),
                      child: const Text("Entrar", style: TextStyle(fontSize: 20)),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.black87,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      minimumSize: const Size(272, 51),
                    ),
                  ), 
              ],
            ),
          ),
        ),
    );
  }
}