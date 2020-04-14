import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tutorinv/screens/signup_account_type_screen.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;

class SignupModal extends StatefulWidget {
  static const routeName = '/signupmodal';
  _SignupModalState createState() => _SignupModalState();
}

class _SignupModalState extends State<SignupModal> {
  bool isLoggedIn = false;

  void initiateFacebookLogin() async{
    final login = FacebookLogin();
    final result = await login.logIn(['email']);
    switch(result.status){
      case FacebookLoginStatus.error:
        print('error');
        break;
      case FacebookLoginStatus.cancelledByUser:
          print('cancelled');
        break;
      case FacebookLoginStatus.loggedIn:
        onLoginStatusChange(true);
        getUserInfo(result);
        break;
    }
  }

  void getUserInfo(FacebookLoginResult result) async{
    final token = result.accessToken.token;
    final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}');
    final profile = json.decode(graphResponse.body);
    print(profile['email']);
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
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            color: Colors.white,
            width: double.infinity,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                        'Crear cuenta con Facebook: ',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                      height: 20,
                    ),
                    FlatButton(
                      child: Text(
                        'Iniciar con Facebook',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      shape: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: Theme.of(context).secondaryHeaderColor,
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(15),
                      onPressed: ()=> initiateFacebookLogin(),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                        'O ingresa tus datos: ',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                      height: 20,
                    ),
                    FlatButton(
                      child: Text(
                        'Crear una cuenta',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      shape: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange, width: 2),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: Theme.of(context).buttonColor,
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(15),
                      onPressed: () {
                        Navigator.of(context).pushNamed(SignupAccountType.routeName);
                      },
                    ),
                    SizedBox(
                      height: 350,
                    ),
                    Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Confirmado este paso, estás aceptando las \n políticas de privacidad de Investig-arte',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: 
                          TextAlign.center,
                      ),
                      FlatButton(
                        child: Text(
                          'Ver términos y condiciones',
                          style: TextStyle(fontSize: 14),
                        ),
                        textColor: Colors.blue,
                        onPressed: () {

                        },
                      ),
                    ],
                  ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
