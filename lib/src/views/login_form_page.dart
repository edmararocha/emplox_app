// ignore_for_file: prefer_const_constructors

import 'package:emplox/src/components/button_back.dart';
import 'package:emplox/src/components/submit_button.dart';
import 'package:flutter/material.dart';

import '../components/field_form.dart';
import '../presenters/LoginPresenter.dart';

class LoginFormPage extends StatefulWidget {
  const LoginFormPage({ Key? key }) : super(key: key);

  @override
  State<LoginFormPage> createState() => _LoginFormPageState();
}

class _LoginFormPageState extends State<LoginFormPage> implements LoginContract {
  late LoginPresenter presenter;


  @override
  void initState() {
    super.initState();
    presenter = LoginPresenter(this);
  }

  @override
  loadingManagement() {
    setState(() {});
  }

  @override
  loginError(String message) {
    return Container(
      child: AlertDialog(
        backgroundColor: Colors.black26,
        title: Text('Erro', style: TextStyle(color: Colors.white),),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message, style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Tentar novamente'),
            onPressed: () {
              presenter.state.value = LoginState.start;
            },
          ),
        ],
      ),
    );
  }

  @override
  loginSuccess() {
    Navigator.of(context).pushReplacementNamed("/home");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedBuilder(
          animation: presenter.state, 
          builder: (context, child) => presenter.stateManagement(presenter.state.value)
        ),
    );
  }

  @override
  loginLoading() {
   return presenter.isLoading ? Center(child: CircularProgressIndicator()) : Container();
  }

  @override
  loginStart() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(right: 40.0,left: 40.0, top: 100.0),
        child: ListView(
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
            Container(height: 90,),

            FieldForm(labelText: "Usuário", controller: presenter.username, pwd: false,),
            Container(height: 20,),
            FieldForm(labelText: "Senha", controller: presenter.password, pwd: true,),
            Container(height: 50,),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: SubmitButton(text: "Login", onPressed: () { 
                presenter.loginManangement(presenter.username.text, presenter.password.text);
              },),
            )
          ],
        ),
      ),
    );
  }
}