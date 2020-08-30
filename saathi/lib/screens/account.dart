import 'package:flutter/material.dart';
import 'package:saathi/services/auth.dart';
import 'package:saathi/main.dart';

import 'authenticate/authenticate.dart';

class Account extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 90, 0, 0),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                          'Name: $name',
                      style: TextStyle(
                        fontSize: 20,
                      ),),
                      Text(
                          'Age: $age years',
                          style: TextStyle(
                          fontSize: 20
                      ),),
                      Text(
                          'Blood Group: $bloodGroup',
                        style: TextStyle(
                            fontSize: 20
                        ),),
                      Text(
                          'Emergency Contacts:',
                        style: TextStyle(
                            fontSize: 20
                        ),),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.phone
                            ),
                            Text(
                              '$emergencyContact1',
                              style: TextStyle(
                                  fontSize: 20
                              ),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                                Icons.phone
                            ),
                            Text(
                              '$emergencyContact2',
                              style: TextStyle(
                                  fontSize: 20
                              ),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color(0xff84a59d),
                      width: 8
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              Container(height: 40,),
              RaisedButton(
                child: Text('Sign Out'),
                color: Color(0xfff6bd60),
                onPressed: () async {
                  await _auth.signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Authenticate()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
