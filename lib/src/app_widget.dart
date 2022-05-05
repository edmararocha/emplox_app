import 'package:emplox/src/views/add_func.dart';
import 'package:emplox/src/views/home_page.dart';
import 'package:emplox/src/views/login_form_page.dart';
import 'package:emplox/src/views/login_page.dart';
import 'package:emplox/src/views/register_page.dart';
import 'package:emplox/src/views/update_func.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Tomorrow',
      ),
    
      initialRoute: '/',

      routes: {
        '/': (context) => const LoginPage(),
        '/login_form': (context) => const LoginFormPage(),
        '/register_form': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
        '/add_func': (context) => const AddFuncPage(),
        '/update_func': (context) => const UpdateFunc(),
      },
    );
  }
}