import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tutorinv/screens/signup_account_type_screen.dart';

import './screens/getting_started_screen.dart';
import './screens/login_screen.dart';
import './screens/signup_screen.dart';
import './screens/home_screen.dart';
import './screens/signup_modal_screen.dart';
import './screens/welcome_screen.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tutor Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        secondaryHeaderColor: Colors.deepOrange,
      ),
      home: GettingStartedScreen(),
      routes: {
        LoginScreen.routeName: (ctx) => LoginScreen(),
        SignupScreen.routeName: (ctx) => SignupScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
        SignupModal.routeName: (ctx) => SignupModal(),
        SignupAccountType.routeName: (ctx) => SignupAccountType(),
        WelcomeScreen.routeName: (ctx) => WelcomeScreen(),
      },
    );
  }
}

