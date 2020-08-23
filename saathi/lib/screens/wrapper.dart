import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saathi/main.dart';
import 'package:saathi/models/user.dart';
import 'package:saathi/screens/authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);

    if (user == null){
      return Authenticate();
    } else {
      return MyHomePage();
    }

  }
}