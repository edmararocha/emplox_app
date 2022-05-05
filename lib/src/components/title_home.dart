import 'package:flutter/material.dart';

class TittleHome extends StatelessWidget {
  const TittleHome({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: const Text(
            'Funcionários',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(height: 20,),
        Container(
          alignment: Alignment.center,
          child: const Text(
            'Clique no card para editar o usuário',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}