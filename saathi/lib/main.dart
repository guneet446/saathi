import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_it/get_it.dart';
import "call_service.dart";

GetIt locator = GetIt.I;

void setupLocator() {
  locator.registerSingleton(CallService());
}

void main() {
  setupLocator();
  return runApp(MyApp());
}


class MyApp extends StatelessWidget {
  final appTitle = 'Saathi';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final CallService _service = locator<CallService>();
  String number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: PopupMenuButton<int>(
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 1,
              child: Text("Ambulance"),
            ),
            PopupMenuItem(
              value: 2,
              child: Text("Police"),
            ),
            PopupMenuItem(
              value: 3,
              child: Text("Fire"),
            ),
          ],
          onCanceled: () {
            print("You have canceled the call");
          },
          onSelected: (value) {
            if (value == 1)
              number = '102';
            else if (value == 2)
              number = '100';
            else if (value == 3)
              number = '101';
            _service.call(number);
          },
          child: CircleAvatar(
            backgroundColor: Colors.red,
            radius: 85,
            child: Text(
              'EMERGENCY',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ),),
          ),
        ),
      ),

      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 100.0,
              child: DrawerHeader(
                child: Text(
                  'At your sevice',
                  style: TextStyle(fontSize: 40.0),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
            ),
            ListTile(
              title: Text('Medicines'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                runApp(MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Medicines',
                  home:Medicines(),
                ));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Reminders'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                runApp(MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Prescriptions',
                  home: Reminders(),

                ));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Prescriptions'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                runApp(MaterialApp(
                  debugShowCheckedModeBanner : false,
                  title: 'Prescriptions',
                  home: Prescriptions(),

                ));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Contacts'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer

                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('House Help'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}


class Medicines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('medicines')),
      body: Center(
        child: RaisedButton(
          child: Text('Add a new medicine'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewMedicine()),
            );
          },
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 100.0,
              child: DrawerHeader(
                child: Text(
                  'At your sevice',
                  style: TextStyle(fontSize: 40.0),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
            ),
            ListTile(
              title: Text('go back'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                runApp(MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Medicines',
                  home:MyApp(),
                ));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Reminders'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                runApp(MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Prescriptions',
                  home: Reminders(),

                ));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Prescriptions'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                runApp(MaterialApp(
                  debugShowCheckedModeBanner : false,
                  title: 'Prescriptions',
                  home: Prescriptions(),

                ));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Contacts'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer

                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('House Help'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
class NewMedicine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New medicine"),
      ),
      body: Center(
          child:Text('hello')
      ),
    );
  }
}

class Prescriptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Prescriptions')),
      body: Center(
        child: RaisedButton(
          child: Text('Add a new prescription'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewPrescription()),
            );
          },
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 100.0,
              child: DrawerHeader(
                child: Text(
                  'At your sevice',
                  style: TextStyle(fontSize: 40.0),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
            ),
            ListTile(
              title: Text('go back'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                runApp(MaterialApp(
                  debugShowCheckedModeBanner : false,
                  title: 'Saathi',
                  home: MyApp(),

                ));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Medicines'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                runApp(MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Medicines',
                  home:Medicines(),
                ));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Reminders'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                runApp(MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Reminders',
                  home: Reminders(),

                ));
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: Text('Contacts'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer

                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('House Help'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
class NewPrescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New prescription"),
      ),
      body: Center(
          child:Text('heyyy')
      ),
    );
  }
}
class Reminders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reminders')),
      body: Center(
        child: RaisedButton(
          child: Text('Add a new reminder'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewReminder()),
            );
          },
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 100.0,
              child: DrawerHeader(
                child: Text(
                  'At your sevice',
                  style: TextStyle(fontSize: 40.0),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
            ),
            ListTile(
              title: Text('go back'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                runApp(MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Saathi',
                  home:MyApp(),
                ));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Medicines'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                runApp(MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Medicines',
                  home: Medicines(),

                ));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Prescriptions'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                runApp(MaterialApp(
                  debugShowCheckedModeBanner : false,
                  title: 'Prescriptions',
                  home: Prescriptions(),

                ));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Contacts'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer

                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('House Help'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
class NewReminder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New reminder"),
      ),
      body: Center(
          child:Text('heyyy')
      ),
    );
  }
}
