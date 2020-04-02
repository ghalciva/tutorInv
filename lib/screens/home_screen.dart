import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPage = 0;
  final _pageOptions = [
    Text('Item1'),
    Text('Item2'),
    Text('Item3'),
    Text('Item4'),
    Text('Item5'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutor de Investigacion'),
      ),
      body: _pageOptions[_selectedPage],
      drawerScrimColor: Colors.blueGrey,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.blue,
        selectedItemColor: Colors.blue,
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            title: Text('Mensajes'),
            ),

            BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            title: Text('Mis archivos'),
            ),

            BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            title: Text('Subir archivo'),
            ),

            BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Buscar'),
            ),

            BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Mi Perfil'),
            ),
        ],
      ),
    );
  }
}
