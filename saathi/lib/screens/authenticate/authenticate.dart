import 'package:flutter/material.dart';
import 'package:saathi/screens/authenticate/register.dart';
import 'package:saathi/screens/authenticate/signin.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text(
                'Sign in',
                style: TextStyle(fontSize: 24),),
              onPressed: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignIn()),
                );
              },
            ),
            RaisedButton(
              child: Text(
                  'Register',
                  style: TextStyle(fontSize: 24),),
              onPressed: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Register()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}