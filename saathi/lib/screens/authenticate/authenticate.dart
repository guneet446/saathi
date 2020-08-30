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
      backgroundColor: Color(0xfff5cac3),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ButtonTheme(
              minWidth: 150,
              height: 60,
              child: RaisedButton(
                color: Color(0xff84a59d),
                child: Text(
                  'Sign in',
                  style: TextStyle(
                      fontSize: 26,
                  color: Colors.white),),
                onPressed: (){
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()),
                  );
                },
              ),
            ),
            ButtonTheme(
              minWidth: 150,
              height: 60,
              child: RaisedButton(
                color: Color(0xff84a59d),
                child: Text(
                    'Register',
                    style: TextStyle(
                        fontSize: 26,
                    color: Colors.white),),
                onPressed: (){
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Register()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}