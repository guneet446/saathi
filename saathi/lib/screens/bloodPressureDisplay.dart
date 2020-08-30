import 'package:flutter/material.dart';
import 'package:saathi/main.dart';

class BPDisplay extends StatefulWidget {
  @override
  _BPDisplayState createState() => _BPDisplayState();
}

class _BPDisplayState extends State<BPDisplay> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: ListView(
          children: <Widget>[
            Card(
              child: ListTile(
                title: Text('Systolic: $bps     Diastolic: $bpd '),
                subtitle: Text('Date: $dateStr'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Systolic: 120     Diastolic: 80 '),
                subtitle: Text('Date: 2020-08-29'),
              ),
            ),
            Card(
              child: ListTile(
                  title: Text('Systolic: 132     Diastolic: 75'),
                  subtitle: Text('Date: 2020-08-28')),
            ),
            Card(
              child: ListTile(
                title: Text('Systolic: 125     Diastolic: 72'),
                subtitle: Text('Date: 2020-08-27'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Systolic: 130     Diastolic: 77 '),
                subtitle: Text('Date: 2020-08-26'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Systolic: 135     Diastolic: 70 '),
                subtitle: Text('Date: 2020-08-25'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Systolic: 126     Diastolic: 74 '),
                subtitle: Text('Date: 2020-08-24'),
              ),
            ),
          ],
        ),
    );
  }
}
