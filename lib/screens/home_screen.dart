import 'package:flutter/material.dart';
import 'package:tutorinv/screens/my_files_screen.dart';
import 'package:tutorinv/screens/messages_screen.dart';
import 'package:tutorinv/screens/my_profile_screen.dart';
import 'package:tutorinv/screens/search_screen.dart';
import 'package:tutorinv/screens/upload_files_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPage = 0;

  final List<Widget>_pageOptions = [
    MessageScreen(),
    MyFilesScreen(),
    UploadFilesScreen(),
    SearchScreen(),
    MyProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedPage],
      drawerScrimColor: Colors.blueGrey,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.deepOrange,
        currentIndex: _selectedPage,
        type: BottomNavigationBarType.fixed,
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
            title: Text('Archivos'),
            ),

            BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            title: Text('Subir'),
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
