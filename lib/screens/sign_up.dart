import 'package:crud_pet_app/screens/choose.dart';
import 'package:crud_pet_app/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/reusabletextfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _unTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  Widget buildSignUpBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          FirebaseAuth.instance
              .createUserWithEmailAndPassword(
            email: _emailTextController.text,
            password: _passwordTextController.text,
          )
              .then((value) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => choose(),
                ));
          });
        },
        child: const Text('Sign Up',
            style: TextStyle(color: Colors.white, fontSize: 18)),
        style: ElevatedButton.styleFrom(
            primary: Colors.redAccent,
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget buildSignInBtn() {
    return Container(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ));
        },
        child: Text('Already have an account?'),
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
                    ])),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      reusableTextField("Enter Email", Icons.email, false,
                          _emailTextController),
                      SizedBox(
                        height: 20,
                      ),
                      reusableTextField("Enter Username", Icons.person_rounded,
                          false, _unTextController),
                      SizedBox(
                        height: 20,
                      ),
                      reusableTextField("Enter password", Icons.lock, true,
                          _passwordTextController),
                      SizedBox(
                        height: 30,
                      ),

                      //buildConfirmPassword(),
                      buildSignUpBtn(),
                      SizedBox(
                        height: 20,
                      ),
                      buildSignInBtn(),
                      //buildPassword(),
                      //buildForgotPassBtn(),
                      //buildLoginBtn(),
                      //buildSignUpBtn(),
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
