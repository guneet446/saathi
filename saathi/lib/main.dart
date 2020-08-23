import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:saathi/screens/authenticate/authenticate.dart';
import 'package:saathi/services/auth.dart';
import 'services/call_service.dart';
import 'package:image_picker/image_picker.dart';
import 'screens/wrapper.dart';
import 'models/user.dart';


GetIt locator = GetIt.I;

void setupLocator() {
  locator.registerSingleton(CallService());
}

void main() {
  setupLocator();
  return runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final CallService _service = locator<CallService>();
  String number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Saathi')),
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
                  'At your service',
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
                  home: Medicines(),
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
            ListTile(
              title: Text('My Account'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                runApp(MaterialApp(
                  debugShowCheckedModeBanner : false,
                  title: 'My Account',
                  home: MyAccount(),

                ));
                /*Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),);*/
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

class Prescriptions extends StatefulWidget {
  @override
  _PrescriptionsState createState() => _PrescriptionsState();
}

class _PrescriptionsState extends State<Prescriptions> {
  final _picker = ImagePicker();
  PickedFile _image;

  @override
  Widget build(BuildContext context) {
    print('Prescription');
    return Scaffold(
      appBar: AppBar(title: Text('Prescriptions')),
      body: Center(
        child: RaisedButton.icon(
          label: _image == null ? Text('Add a new prescription') : Text(
              'Prescription added'),
          icon: Icon(Icons.add_a_photo),
          onPressed: _getImage,
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
                  home: Medicines(),
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
  Future _getImage() async{
    PickedFile image = await _picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      print('_image: $_image');
    });
  }
}

class Reminders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Reminders');
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
    print('New Reminder');
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

class MyAccount extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    print('My Account');
    return Scaffold(
      appBar: AppBar(
        title: Text("My Account"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Sign Out'),
          onPressed: () async{
            await _auth.signOut();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Authenticate()),
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

