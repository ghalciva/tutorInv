import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tutorinv/model/file.dart';
import 'package:tutorinv/model/services.dart';
import 'package:tutorinv/model/global.dart';

class MyFilesScreen extends StatefulWidget {
  @override
  _MyFilesScreenState createState() => _MyFilesScreenState();
}

class _MyFilesScreenState extends State<MyFilesScreen> {

  List<File> files = List();
  List<File> filtered = List();

  @override
  void initState() { 
    super.initState();
    Services.getFiles().then((filesFromServer) {
      setState(() {
        files = filesFromServer;
        filtered = files;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis archivos', 
          style: TextStyle(
            color: Colors.blueGrey
            )
          ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(10.0),
                itemCount: filtered.length,
                itemBuilder: (BuildContext context, int index){
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          //Image.network(
                            //(filtered[index].file),),
                          Text(
                            filtered[index].subject,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 50,),
                          Text(filtered[index].file),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
