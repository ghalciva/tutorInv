import 'package:flutter/material.dart';

class UploadFilesScreen extends StatefulWidget {
  @override
  _UploadFilesScreenState createState() => _UploadFilesScreenState();
}

class _UploadFilesScreenState extends State<UploadFilesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subir archivos', 
          style: TextStyle(
            color: Colors.blueGrey
            )
          ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Text('Pagina de subir archivos')
        ),
    );
  }
}