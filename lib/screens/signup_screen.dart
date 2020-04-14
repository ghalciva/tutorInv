import 'package:flutter/material.dart';
import './home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class SignupScreen extends StatelessWidget {
  static const routeName = '/signup';

  final _formKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DatabaseReference dbRef = FirebaseDatabase.instance.reference().child("Users");
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void register(context){
    //Navigator.of(context).pushNamed(HomeScreen.routeName);
    firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((result) {
      dbRef.child(result.user.uid).set({
        "email": emailController.text,
        "name": nameController.text
      }).then((res) {
        print(result.user.uid);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      });
    }).catchError((err) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("La contraseña debe contener más de 6 caracteres."),
              actions: [
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
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
                child: Form(
                  key: _formKey,
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
                    TextFormField(
                      controller: emailController,
                      validator: (value){
                        if(value.isEmpty){
                          return 'Ingrese un correo electrónico';
                        }
                        return null;
                      },
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Correo electrónico',
                        prefixIcon: Icon(Icons.email, color: Colors.grey,),
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
                    TextFormField(
                      controller: nameController,
                      validator: (value){
                        if(value.isEmpty){
                          return 'Ingrese un usuario';
                        }
                        return null;
                      },
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
                    TextFormField(
                      controller: passwordController,
                      validator: (value){
                        if(value.isEmpty){
                          return 'Ingrese una contraseña';
                        }
                        return null;
                      },
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
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value){
                        if(value.isEmpty){
                          return 'Ingrese una contraseña';
                        }
                        return null;
                      },
                      obscureText: true,
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Confirmar contraseña',
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
                      height: 50,
                    ),
                    FlatButton(
                      child: Text(
                        'Registarme',
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
                        if(_formKey.currentState.validate()){
                          register(context);
                        }
                      },
                    ),
                  ],
                ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
