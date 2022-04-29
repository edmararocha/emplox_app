import 'package:flutter/material.dart';

import '../components/button_back.dart';
import '../components/field_form.dart';

class UpdateFunc extends StatefulWidget {
  const UpdateFunc({ Key? key }) : super(key: key);

  @override
  State<UpdateFunc> createState() => _UpdateFuncState();
}

class _UpdateFuncState extends State<UpdateFunc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.only(right: 25, left: 25, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
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
              // Container(height: 30,),
              // FieldForm(labelText: "Nome Do Funcionário", controller: () {}),
              // Container(height: 20,),
              // FieldForm(labelText: "Cargo", controller: () {}),
            ],
          ),
        ),
      ),
    );
  }
}