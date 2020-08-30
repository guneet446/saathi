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
              title: Text('Before meal: 4.5     After meal: 5.8'),
              subtitle: Text('Date: 2020-08-29')),
        ),
        Card(
          child: ListTile(
            title: Text('Before meal: 4.3     After meal: 6.0'),
            subtitle: Text('Date: 2020-08-28'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Before meal: 5.0     After meal: 5.1 '),
            subtitle: Text('Date: 2020-08-27'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Before meal: 4.7     After meal: 6.3 '),
            subtitle: Text('Date: 2020-08-26'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Before meal: 5.2     After meal: 6.8 '),
            subtitle: Text('Date: 2020-08-25'),
          ),
        ),
      ],
    );
  }
}
