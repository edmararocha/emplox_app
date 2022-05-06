import 'package:flutter/material.dart';

import '../components/button_back.dart';
import '../components/field_form.dart';
import '../components/submit_button.dart';
import '../presenters/UpdateFuncPresenter.dart';

class UpdateFuncPage extends StatefulWidget {
  const UpdateFuncPage({ Key? key, this.funcId, this.funcName, this.funcRole }) : super(key: key);

  final int? funcId;
  final String? funcName;
  final String? funcRole;

  @override
  State<UpdateFuncPage> createState() => _UpdateFuncPageState(funcId, funcName, funcRole);
}

class _UpdateFuncPageState extends State<UpdateFuncPage> implements UpdateFuncContract {
  
  late UpdateFuncPresenter presenter;

  final int? funcId;
  final String? funcName;
  final String? funcRole;

  bool validate = true;

  _UpdateFuncPageState(this.funcId, this.funcName, this.funcRole);

  @override
  void initState() {
    super.initState();
    presenter = UpdateFuncPresenter(this);
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
      color: Colors.black87,
      child: AlertDialog(
        backgroundColor: Colors.black26,
        title: Text('Erro', style: TextStyle(color: Colors.white),),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Não foi possível atualizar o funcionário!', style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Tentar novamente'),
            onPressed: () {
              presenter.state.value = UpdateFuncState.start;
            },
          ),
        ],
      ),
    );
  }

  @override
  Loading() {
    return presenter.isLoading ? Container(child: Center(child: CircularProgressIndicator()), color: Colors.black87, width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height,) : Container(color: Colors.black87,);
  }

  @override
  Start() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.only(right: 40.0,left: 40.0, top: 40.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ButtonBack(route: '/home',),
            Container(height: 30,),
            Text(
              '''Atualizar Dados Do \nFuncionário''',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 30,
              ),
              textAlign: TextAlign.start,
            ),
            Container(height: 70,),

            FieldForm(labelText: "Funcionário", controller: presenter.name),
            Container(height: 10,),
            FieldForm(labelText: "Cargo", controller: presenter.role),
            Container(height: 40,),
            SubmitButton(text: "Atualizar", onPressed: () {  
              presenter.updateFuncManangement(presenter.name.text, presenter.role.text, funcId);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override 
  Success() {
    Navigator.of(context).pushReplacementNamed("/home");
  }
}