import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({ Key? key, required this.funcName, required this.funcRole, required this.onPressed }) : super(key: key);

  final String funcName;
  final String funcRole;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15),
        child: Column(
          children: [
            Card(
              child: Padding(padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          funcName,
                          style: TextStyle(color: Colors.blue, fontSize: 22),
                        ),
                        Container(height: 10,),
                        Text(funcRole, style: TextStyle(color: Colors.black87, fontSize: 18), textAlign: TextAlign.left,),
                      ],
                    ),
                    Container(width: 20,),
                    ElevatedButton(onPressed: onPressed, child: Icon(Icons.delete),style: ElevatedButton.styleFrom(primary: Colors.redAccent),),
                  ],
                ),
              ),
            ),

            Container(height: 20,),
          ],
        ),
    );
  }
}