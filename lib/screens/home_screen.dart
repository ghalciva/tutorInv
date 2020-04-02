import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom nav bar'),
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            title: Text('Mensajes'),
            backgroundColor: Colors.blueGrey,
            ),

            BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            title: Text('Mis archivos'),
            backgroundColor: Colors.blue,
            ),

            BottomNavigationBarItem(
            icon: Icon(Icons.file_upload),
            title: Text('Subir archivo'),
            backgroundColor: Colors.blue,
            ),

            BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Buscar'),
            backgroundColor: Colors.blue,
            ),

            BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Mi Perfil'),
            backgroundColor: Colors.blue,
            ),

        ],
      ),
    );
  }
}
