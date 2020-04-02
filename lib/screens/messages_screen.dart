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
        child: Text('Pagina de mensajes')
        ),
    );
  } 
}

void choiceAction(String choice){
    if(choice == Constants.Achieved){
      print('Achieved');
    }
  }
