import 'package:flutter/material.dart';
import 'package:saathi/services/auth.dart';

import 'authenticate.dart';

class Account extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text('Sign Out'),
        onPressed: () async {
          await _auth.signOut();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Authenticate()),
          );
        },
      ),
    );
  }
}
