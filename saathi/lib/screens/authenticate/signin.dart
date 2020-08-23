import 'package:flutter/material.dart';
import 'package:saathi/services/auth.dart';

import '../../main.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter your details'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 10),
              TextFormField(
                validator: (val) {
                  return val.isEmpty ? 'Enter an email' : null;
                },
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),

              SizedBox(height: 10),
              TextFormField(
                obscureText: true,
                validator: (val) {
                  return val.length < 6 ? 'Enter a password having more than 6 characters' : null;
                },
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),

              SizedBox(height: 40),
              RaisedButton(
                child: Text('Sign In'),
                onPressed: () async {
                  if(_formKey.currentState.validate()) {
                    dynamic result = await _auth.signIn(email, password);
                    if (result == null) {
                      setState(() {
                        error = 'Could not sign in with those credentials';
                      });
                    }
                    else {
                      runApp(MaterialApp(
                        home: MyHomePage(),
                      ));
                    }
                  }
                },
              ),
              SizedBox(height: 15),
              Text(error),
            ],
          ),
        ),
      ),
    );
  }
}

