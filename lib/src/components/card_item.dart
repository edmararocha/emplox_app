import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15),
      child: GestureDetector(
        onTap:() { Navigator.pushReplacementNamed(context, '/update_func'); },
        child: Card(
          child: Padding(padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Nome De Usuário",
                      style: TextStyle(color: Colors.blue, fontSize: 22),
                    ),
                    Container(height: 10,),
                    Text("Abap", style: TextStyle(color: Colors.black87, fontSize: 18), textAlign: TextAlign.left,),
                  ],
                ),
                Container(width: 20,),
                ElevatedButton(onPressed: () {}, child: Icon(Icons.delete),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}