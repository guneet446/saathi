import 'package:flutter/material.dart';
import 'package:saathi/main.dart';

class SugarDisplay extends StatefulWidget {
  @override
  _SugarDisplayState createState() => _SugarDisplayState();
}

class _SugarDisplayState extends State<SugarDisplay> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          child: ListTile(
            title: Text('Before meal: $sugarb     After meal: $sugara '),
            subtitle: Text('Date: $dateStr'),
          ),
        ),
        Card(
          child: ListTile(
              title: Text('Before meal: 85     After meal: 130'),
              subtitle: Text('Date: 2020-08-29')),
        ),
        Card(
          child: ListTile(
            title: Text('Before meal: 76     After meal: 128'),
            subtitle: Text('Date: 2020-08-28'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Before meal: 83     After meal: 132 '),
            subtitle: Text('Date: 2020-08-27'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Before meal: 88     After meal: 112 '),
            subtitle: Text('Date: 2020-08-26'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Before meal: 95     After meal: 125 '),
            subtitle: Text('Date: 2020-08-25'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Before meal: 93     After meal: 120 '),
            subtitle: Text('Date: 2020-08-24'),
          ),
        ),
      ],
    );
  }
}
