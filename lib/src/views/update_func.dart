import 'package:flutter/material.dart';

import '../components/button_back.dart';
import '../components/field_form.dart';
import '../components/submit_button.dart';
import '../presenters/UpdateFuncPresenter.dart';

class UpdateFuncPage extends StatefulWidget {
  const UpdateFuncPage({Key? key, this.id, this.funcName, this.funcRole})
      : super(key: key);

  final int? id;
  final String? funcName;
  final String? funcRole;

  @override
  State<UpdateFuncPage> createState() =>
      _UpdateFuncPageState(id, funcName, funcRole);
}

class _UpdateFuncPageState extends State<UpdateFuncPage>
    implements UpdateFuncContract {
  late UpdateFuncPresenter presenter;

  final int? id;
  final String? name;
  final String? role;

  bool validateFunc = true;
  bool validateRole = true;

  _UpdateFuncPageState(this.id, this.name, this.role);

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
  void initState() {
    super.initState();
    presenter = UpdateFuncPresenter(this);
  }

  @override
  loadingManagement() {
    setState(() {});
  }

  @override
  Error() {
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
                'Não foi possível atualizar o funcionário!',
                style: TextStyle(color: Colors.white),
              ),
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
    return presenter.isLoading
        ? Container(
            child: Center(child: CircularProgressIndicator()),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          )
        : Container();
  }

  @override
  Start() {
    print("id: ${widget.id}");
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(right: 40.0, left: 40.0, top: 50.0),
        child: ListView(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment:  CrossAxisAlignment.start,
              children: [
                 ButtonBack(
                  route: '/home',
                ),
                Container(
                  height: 50,
                ),
                Text(
                  '''Atualizar Dados Do \nFuncionário''',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.start,
                ),
              ]
            ),
            Container(
              height: 50,
            ),
            FieldForm(labelText: "Funcionário", controller: presenter.name, pwd: false, errorText: validateFunc ? null : "Campo obrigatório",),
            Container(
              height: 20,
            ),
            FieldForm(labelText: "Cargo", controller: presenter.role, pwd: false, errorText: validateRole ? null : "Campo obrigatório"),
            Container(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: SubmitButton(
                text: "Atualizar",
                onPressed: () {
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
                    presenter.updateFuncManangement(
                      presenter.name.text, presenter.role.text, widget.id);
                  }
                },
              ),
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
