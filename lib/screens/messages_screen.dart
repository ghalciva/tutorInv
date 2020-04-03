import 'package:flutter/material.dart';
import '../constants/constants.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Mensajes', 
          style: TextStyle(
            color: Colors.blueGrey
            )
          ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context){
              return Constants.choices.map((String choice){
                return PopupMenuItem<String>(
                  child: Text(choice),
                  value: choice);
              }).toList();
            },
            )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bienvenido a tus mensajes', 
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
                ),
              ),
            SizedBox(
                height: 20,
              ),
            Text(
              'Parece que no tienes ningun mensaje \n ¿Qué esperas? Conéctate.', 
              style: 
              TextStyle(fontSize: 16), 
              textAlign: 
              TextAlign.center,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text(
                    'Navega',
                    style: TextStyle(
                      fontSize: 15,
                      ),
                    ),
                    textColor: 
                      Colors.deepOrange, 
                      onPressed: () {
                      },
                ),
                Text(
                  'o', 
                  style: 
                  TextStyle(fontSize: 16),
                ),
                FlatButton(
                  child: Text(
                    'Sube un proyecto',
                    style: TextStyle(
                      fontSize: 15
                      ),
                    ),
                    textColor: 
                      Colors.deepOrange, 
                      onPressed: () {
                      },
                ),
              ],
            )



          ],
        )
        ),
    );
  } 
}

void choiceAction(String choice){
    if(choice == Constants.Achieved){
      print('Achieved');
    }
  }
