import 'package:flutter/material.dart';
import '../screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Login'),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        color: Colors.white,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              height: 130,
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              style: TextStyle(fontSize: 18, color: Colors.black54),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Usuario',
                prefixIcon: Icon(Icons.person, color: Colors.grey,),
                contentPadding: const EdgeInsets.all(15),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(5),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: true,
              style: TextStyle(fontSize: 18, color: Colors.black54),
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Contraseña',
                prefixIcon: Icon(Icons.lock, color: Colors.grey,),
                contentPadding: const EdgeInsets.all(15),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(5),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text(
                    'Olvidé mi contraseña',
                     style: TextStyle(fontSize: 16),
                 ),
                  textColor: Colors.grey,
                  onPressed: () {
                   
                  },
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            FlatButton(
              child: Text(
                'Ingresar',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              shape: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.all(15),
              color: Theme.of(context).buttonColor,
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pushNamed(HomeScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
