import 'package:flutter/material.dart';

class MyProfileScreen extends StatefulWidget {
  static const routeName = '/myprofile';
  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
  final String profileData;

  MyProfileScreen({Key key, this.profileData,}) : super(key: key);
}

class _MyProfileScreenState extends State<MyProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi perfil', 
          style: TextStyle(
            color: Colors.blueGrey
            )
          ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: Center(
        //child: Text('Pagina de mi cuenta'),
        child: Column(
          children: <Widget>[
            Text('Pagina de mi cuenta'),
            Text(widget.profileData),
          ],
          ),
        ),
    );
  }
}