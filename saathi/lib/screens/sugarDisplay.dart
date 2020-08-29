import 'package:flutter/material.dart';

class SugarDisplay extends StatefulWidget {
  @override
  _SugarDisplayState createState() => _SugarDisplayState();
}

class _SugarDisplayState extends State<SugarDisplay> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        Card(
          child: ListTile(
            title: Text('Before meal: 4.2     After meal: 6.2 '),
            subtitle: Text('Date: 21/08/20'),
          ),
        ),
        Card(
          child: ListTile(
              title: Text('Before meal: 4.5     After meal: 5.8'),
              subtitle: Text('Date: 22/08/20')),
        ),
        Card(
          child: ListTile(
            title: Text('Before meal: 4.3     After meal: 6.0'),
            subtitle: Text('Date: 23/08/20'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Before meal: 5.0     After meal: 5.1 '),
            subtitle: Text('Date: 24/08/20'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Before meal: 4.7     After meal: 6.3 '),
            subtitle: Text('Date: 25/08/20'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Before meal: 5.2     After meal: 6.8 '),
            subtitle: Text('Date: 26/08/20'),
          ),
        ),
      ],
    );
  }
}
