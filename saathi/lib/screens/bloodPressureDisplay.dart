import 'package:flutter/material.dart';

class BPDisplay extends StatefulWidget {
  @override
  _BPDisplayState createState() => _BPDisplayState();
}

class _BPDisplayState extends State<BPDisplay> {
  @override
  Widget build(BuildContext context) {

    return ListView(
      children: const <Widget>[
        Card(
          child: ListTile(
            title: Text('Systolic: 120     Diastolic: 80 '),
            subtitle: Text('Date: 21/08/20'),
          ),
        ),
        Card(
          child: ListTile(
              title: Text('Systolic: 132     Diastolic: 75'),
              subtitle: Text('Date: 22/08/20')),
        ),
        Card(
          child: ListTile(
            title: Text('Systolic: 125     Diastolic: 72'),
            subtitle: Text('Date: 23/08/20'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Systolic: 130     Diastolic: 77 '),
            subtitle: Text('Date: 24/08/20'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Systolic: 135     Diastolic: 70 '),
            subtitle: Text('Date: 25/08/20'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Systolic: 126     Diastolic: 74 '),
            subtitle: Text('Date: 26/08/20'),
          ),
        ),
      ],
    );
  }
}
