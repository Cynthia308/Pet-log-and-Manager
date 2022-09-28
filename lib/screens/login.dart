import 'package:crud_pet_app/screens/choose.dart';
import 'package:crud_pet_app/screens/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/reusabletextfield.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  Widget buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: _emailTextController.text,
                  password: _passwordTextController.text)
              .then((value) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => choose(),
                ));
          });
        },
        child: const Text('Login',
            style: TextStyle(color: Colors.white, fontSize: 18)),
        style: ElevatedButton.styleFrom(
            primary: Colors.redAccent,
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget buildSignUpBtn() {
    return Container(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUp(),
              ));
        },
        child: Text('Don\'t have an account?'),
        style: TextButton.styleFrom(
            primary: Colors.black, textStyle: TextStyle(fontSize: 18)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.redAccent,
                      Color.fromARGB(255, 221, 88, 88),
                      Color.fromARGB(204, 255, 138, 102),
                      Color.fromARGB(153, 221, 134, 100),
                      //Color.fromARGB(102, 182, 98, 65),
                    ])),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 80),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Pet Log',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Arial',
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Image.asset(
                        'assets/images/paws.png',
                        height: 145,
                        width: 145,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      reusableTextField("Enter Email", Icons.email, false,
                          _emailTextController),
                      SizedBox(
                        height: 20,
                      ),
                      reusableTextField("Enter Password", Icons.lock, true,
                          _passwordTextController),
                      SizedBox(
                        height: 20,
                      ),
                      //buildForgotPassBtn(),
                      buildLoginBtn(),
                      buildSignUpBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
