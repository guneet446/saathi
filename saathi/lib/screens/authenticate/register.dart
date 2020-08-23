import 'package:flutter/material.dart';
import 'package:saathi/main.dart';
import 'package:saathi/screens/wrapper.dart';
import 'package:saathi/services/auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String age = '';
  String bloodGroup = '';
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

              SizedBox(height: 10),
              TextFormField(
                validator: (val) {
                  return val.isEmpty ? 'Enter your name' : null;
                },
                onChanged: (val) {
                  setState(() => name = val);
                },
              ),

              SizedBox(height: 10),
              TextFormField(
                validator: (val) {
                  return val.isEmpty ? 'Enter your age' : null;
                },
                onChanged: (val) {
                  setState(() => age = val);
                },
              ),

              SizedBox(height: 10),
              TextFormField(
                onChanged: (val) {
                  setState(() => bloodGroup = val);
                },
              ),

              SizedBox(height: 40),
              RaisedButton(
                child: Text('Register'),
                onPressed: () async{
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _auth.register(email, password, name, age);
                    if (result == null) {
                      setState(() {
                        error = 'provide a valid email';
                      });
                    }
                    else {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage()));
                      /*Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );*/
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
