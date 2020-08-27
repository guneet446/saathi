import 'package:cloud_firestore/cloud_firestore.dart';
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
import 'services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'services/auth.dart';

GetIt locator = GetIt.I;
final FirebaseAuth _auth = FirebaseAuth.instance;

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
            PopupMenuItem(
              value: 4,
              child: Text("Family 1"),
            ),
            PopupMenuItem(
              value: 5,
              child: Text("Family 2"),
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
            else if (value == 4)
              number = '101';
            else if (value == 5)
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

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //launch for  direct calling
        },
        child: Icon(Icons.call),
        backgroundColor: Colors.green,
      ),


      drawer: Drawer(
        child: ListView(
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
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Medicines()));
              },
            ),
            ListTile(
              title: Text('Reminders'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Reminders()));
              },
            ),
            ListTile(
              title: Text('Prescriptions'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Prescriptions()));
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
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyAccount()));
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
                    'At your service',
                    style: TextStyle(fontSize: 40.0),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
              ),
              ListTile(
                title: Text('Home'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage()));
                },
              ),
              ListTile(
                title: Text('Reminders'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Reminders()));
                },
              ),
              ListTile(
                title: Text('Prescriptions'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Prescriptions()));
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyAccount()));
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
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().prescriptions,
      child: Scaffold(
        appBar: AppBar(title: Text('Prescriptions')),
        body: Center(
          child: RaisedButton.icon(
            label: _image == null ? Text('Add a new prescription') : Text('Prescription added'),
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
                    'At your service',
                    style: TextStyle(fontSize: 40.0),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
              ),
              ListTile(
                title: Text('Home'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage()));
                },
              ),
              ListTile(
                title: Text('Medicines'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Medicines()));
                },
              ),
              ListTile(
                title: Text('Reminders'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Reminders()));
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyAccount()));
                },
              ),
            ],
          ),
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
                  'At your service',
                  style: TextStyle(fontSize: 40.0),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage()));
              },
            ),
            ListTile(
              title: Text('Medicines'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Medicines()));
              },
            ),
            ListTile(
              title: Text('Prescriptions'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Prescriptions()));
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
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyAccount()));
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
                  'At your service',
                  style: TextStyle(fontSize: 40.0),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage()));
              },
            ),
            ListTile(
              title: Text('Medicines'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Medicines()));
              },
            ),
            ListTile(
              title: Text('Reminders'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Reminders()));
              },
            ),
            ListTile(
              title: Text('Prescriptions'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Prescriptions()));
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

