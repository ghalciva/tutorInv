import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import '../screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoggedIn = false;

  void initiateFacebookLogin() async{
    var login = FacebookLogin();
    var result = await login.logIn(['email']);
    switch(result.status){
      case FacebookLoginStatus.error:
        print('error');
        break;
      case FacebookLoginStatus.cancelledByUser:
          print('cancelled');
        break;
      case FacebookLoginStatus.loggedIn:
        onLoginStatusChange(true);
        break;
    }
  }

  void onLoginStatusChange(bool isLoggedIn){
    setState((){
      this.isLoggedIn = isLoggedIn;
    });
  }

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
            SizedBox(
              height: 40,
            ),
            FlatButton(
              child: Text(
                'Ingresar con Facebook',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              shape: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.all(15),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () {
                
              },
            ),
          ],
        ),
      ),
    );
  }
}
