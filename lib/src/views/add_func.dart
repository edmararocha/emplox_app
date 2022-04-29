// ignore_for_file: prefer_const_constructors

import 'package:emplox/src/components/button_back.dart';
import 'package:emplox/src/components/field_form.dart';
import 'package:flutter/material.dart';

class AddFunc extends StatefulWidget {
  const AddFunc({ Key? key }) : super(key: key);

  @override
  State<AddFunc> createState() => _AddFuncState();
}

class _AddFuncState extends State<AddFunc> {
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
                '''Cadastrar Funcionário''',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                ),
                textAlign: TextAlign.start,
              ),
              Container(height: 30,),
              FieldForm(labelText: "Nome Do Funcionário", controller: () {}),
              Container(height: 20,),
              FieldForm(labelText: "Cargo", controller: () {}),
            ],
          ),
        ),
      ),
    );
  }
}