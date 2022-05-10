// ignore_for_file: prefer_const_constructors

import 'package:emplox/src/components/button_back.dart';
import 'package:flutter/material.dart';

import '../components/field_form.dart';
import '../components/submit_button.dart';
import '../presenters/RegisterPresenter.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    implements RegisterContract {
  late RegisterPresenter presenter;
  bool validate = true;
  String message = "";

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
      child: AlertDialog(
        backgroundColor: Colors.black26,
        title: Text(
          'Erro',
          style: TextStyle(color: Colors.white),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                'Não foi possível cadastrar o usuário!',
                style: TextStyle(color: Colors.white),
              ),
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
          builder: (context, child) =>
              presenter.stateManagement(presenter.state.value)),
    );
  }

  @override
  registerLoading() {
    return presenter.isLoading
        ? Center(child: CircularProgressIndicator())
        : Container();
  }

  @override
  registerStart() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 40.0, left: 40.0, top: 100.0),
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
            Container(
              height: 90,
            ),
            FieldForm(
              labelText: "Usuário",
              controller: presenter.username,
              pwd: false,
              errorText: validate ? null : "Campo obrigatório",
            ),
            Container(
              height: 20,
            ),
            FieldForm(
              labelText: "Email",
              controller: presenter.email,
              pwd: false,
              errorText: validate ? null : message,
            ),
            Container(
              height: 20,
            ),
            FieldForm(
              labelText: "Senha",
              controller: presenter.password,
              pwd: true,
              errorText: validate ? null : "Campo obrigatório",
            ),
            Container(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: SubmitButton(
                text: "Registrar-Se",
                onPressed: () {
                  if (presenter.username.text.isEmpty) {
                    validate = false;
                    this.loadingManagement();
                  } else if (presenter.email.text.isEmpty) {
                    validate = false;
                    message = "Campo obrigatório";
                    this.loadingManagement();
                  } else if (!presenter.email.text.contains("@")) {
                    validate = false;
                    message = "Email inválido";
                    this.loadingManagement();
                  } else if (presenter.password.text.isEmpty) {
                    validate = false;
                    this.loadingManagement();
                  } else {
                    validate = true;
                    presenter.registerManangement(presenter.username.text,
                        presenter.email.text, presenter.password.text);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
