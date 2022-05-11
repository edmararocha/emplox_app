// ignore_for_file: prefer_const_constructors

import 'package:emplox/src/components/button_back.dart';
import 'package:emplox/src/components/field_form.dart';
import 'package:flutter/material.dart';

import '../components/submit_button.dart';
import '../presenters/AddFuncPresenter.dart';


class AddFuncPage extends StatefulWidget {
  const 
  AddFuncPage({ Key? key }) : super(key: key);

  @override
  State<AddFuncPage> createState() => _AddFuncPageState();
}

class _AddFuncPageState extends State<AddFuncPage> implements AddFuncContract {
  late AddFuncPresenter presenter;
  bool validateFunc = true;
  bool validateRole = true;

  @override
  void initState() {
    super.initState();
    presenter = AddFuncPresenter(this);
  }

  @override
  loadingManagement() {
    setState(() {});
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
  Error() {
    return Container(
      child: AlertDialog(
        backgroundColor: Colors.black26,
        title: Text('Erro', style: TextStyle(color: Colors.white),),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Não foi possível cadastrar o funcionário!', style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Tentar novamente'),
            onPressed: () {
              presenter.state.value = AddFuncState.start;
            },
          ),
        ],
      ),
    );
  }

  @override
  Loading() {
    return presenter.isLoading ? Center(child: CircularProgressIndicator()) : Container();
  }

  @override
  Start() {
   return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(right: 40.0,left: 40.0, top: 100.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ButtonBack(route: '/home',),
              Container(height: 50,),
              Text(
                '''Cadastrar Funcionário''',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                ),
                textAlign: TextAlign.start,
              ),
              Container(height: 50,),
        
              FieldForm(labelText: "Nome do funcionário", controller: presenter.name, pwd: false, errorText: validateFunc ? null : "Campo obrigatório",),
              Container(height: 20,),
              FieldForm(labelText: "Cargo", controller: presenter.role, pwd: false, errorText: validateRole ? null : "Campo obrigatório",),
              Container(height: 50,),
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: SubmitButton(text: "Registrar", onPressed: () { 
                  if (presenter.name.text.isEmpty) {
                      validateFunc = false;
                      this.loadingManagement();
                    } else if (presenter.role.text.isEmpty) {
                      validateFunc = true;
                      validateRole = false;
                      this.loadingManagement();
                    } else {
                      validateFunc = true;
                      validateRole = true;
                      presenter.registerManangement(presenter.name.text, presenter.role.text);
                    }
                  },),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Success() {
    Navigator.of(context).pushReplacementNamed("/home");
  }
}