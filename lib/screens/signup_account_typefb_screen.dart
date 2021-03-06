import 'package:flutter/material.dart';
import 'package:tutorinv/screens/home_screen.dart';

import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tutorinv/screens/my_profile_screen.dart';

class SignupAccountTypeFb extends StatefulWidget {
  static const routeName = '/signupaccounttypefb';
  _SignupAccountTypeFbState createState() => _SignupAccountTypeFbState();
}

class _SignupAccountTypeFbState extends State<SignupAccountTypeFb> {

  bool isLoggedIn = false;
  var profileData;

  void hireRole(context){
    //validate if user clicked fb register or normal register
    //then asign hire role 
    initiateFacebookLogin();
    print('investigador');        

  }

  void workerRole(context){
    //validate if user clicked fb register or normal register
    //then asign worker role 
    print('cliente');
    initiateFacebookLogin();
  }

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
    Navigator.of(context).pushNamed(HomeScreen.routeName);
    print(profile.toString()); //shows data array
    MaterialPageRoute(builder: (context) => MyProfileScreen(profileData : profile.toString())); 
  }

  void onLoginStatusChange(bool isLoggedIn, {profileData}){
    setState((){
      this.isLoggedIn = isLoggedIn;
      this.profileData = profileData;
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
                        'Selecciona tu cuenta: ',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                      height: 20,
                    ),
                    FlatButton(
                      child: Text(
                        'Soy investigador',
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
                        //hire role
                        hireRole(context);
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FlatButton(
                      child: Text(
                        'Necesito asesoría',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      shape: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: Theme.of(context).buttonColor,
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(15),
                      onPressed: () {
                        workerRole(context);
                        //worker role
                      },
                    ),
                    SizedBox(
                      height: 350,
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
