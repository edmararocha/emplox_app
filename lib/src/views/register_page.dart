// ignore_for_file: prefer_const_constructors

import 'package:emplox/src/components/button_back.dart';
import 'package:flutter/material.dart';

import '../components/field_form.dart';
import '../components/submit_button.dart';
import '../presenters/RegisterPresenter.dart';

class RegisterPage extends StatefulWidget {
  const 
  RegisterPage({ Key? key }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> implements RegisterContract {
  late RegisterPresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = RegisterPresenter(this);
  }

  @override
  loadingManagement() {
    setState(() {});
  }

  @override
  registerError() {
    return Container(
      color: Colors.black87,
      child: AlertDialog(
        backgroundColor: Colors.black26,
        title: Text('Erro', style: TextStyle(color: Colors.white),),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Não foi possível cadastrar o usuário!', style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Tentar novamente'),
            onPressed: () {
              presenter.state.value = RegisterState.start;
            },
          ),
        ],
      ),
    );
  }

  @override
  registerSuccess() {
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
  registerLoading() {
   return presenter.isLoading ? Container(child: Center(child: CircularProgressIndicator()), color: Colors.black87, width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height,) : Container(color: Colors.black87,);
  }

  @override
  registerStart() {
    return Container(
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

            FieldForm(labelText: "Usuário", controller: presenter.username),
            Container(height: 10,),
            FieldForm(labelText: "Email", controller: presenter.email),
            Container(height: 10,),
            FieldForm(labelText: "Senha", controller: presenter.password),
            Container(height: 40,),
            SubmitButton(text: "Registrar-Se", onPressed: () { presenter.registerManangement(presenter.username.text, presenter.email.text, presenter.password.text);},)
          ],
        ),
      ),
    );
  }
}