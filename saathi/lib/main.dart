import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:saathi/screens/addPrescription.dart';
import 'package:saathi/screens/authenticate/authenticate.dart';
import 'package:saathi/screens/home.dart';
import 'package:saathi/services/auth.dart';
import 'package:saathi/services/database.dart';
import 'services/call_service.dart';
import 'package:image_picker/image_picker.dart';
import 'screens/wrapper.dart';
import 'models/user.dart';
import 'models/prescription.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:saathi/animations/fade_animation.dart';
import 'package:saathi/widgets/AddMedicine.dart';
import 'package:saathi/widgets/MedicineEmptyState.dart';
import 'package:scoped_model/scoped_model.dart';

import 'enums/icon_enum.dart';
import 'models/Medicine.dart';
import 'widgets/AppBar.dart';
import 'widgets/DeleteIcon.dart';
import 'widgets/MedicineGridView.dart';

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
      /*child: StreamProvider<List<Prescription>>.value(
        value: DatabaseService().prescription,*/
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Wrapper(),
        ),
      //),
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
  DateTime _dateTime;
  String bps = "";
  String bpd = "";

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('Saathi')),
        body: Home(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //launch for  direct calling
          },
          child: Icon(Icons.call),
          backgroundColor: Colors.green,
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
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Medicines()));
                },
              ),
              ListTile(
                title: Text('Reminders'),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Reminders()));
                },
              ),
              ListTile(
                title: Text('Prescriptions'),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Prescriptions()));
                },
              ),
              ListTile(
                title: Text('Blood Pressure'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => BloodPressure()));
                },
              ),
              ListTile(
                title: Text('Sugar'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Sugar()));
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
<<<<<<< HEAD
            ],
          ),
          Center(
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
                  number = 'XXX';
                else if (value == 5) number = 'XXX';
                _service.call(number);
              },
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 50,
                child: Text(
                  'EMERGENCY',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
=======
              ListTile(
                title: Text('My Account'),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => MyAccount()));
                },
>>>>>>> 6753d03f049d681d270eb20541a4dc53882bebef
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
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
            ),
            ListTile(
              title: Text('Reminders'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Reminders()));
              },
            ),
            ListTile(
              title: Text('Prescriptions'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Prescriptions()));
              },
            ),
            ListTile(
              title: Text('Blood Pressure'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BloodPressure()));
              },
            ),
            ListTile(
              title: Text('Sugar'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Sugar()));
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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MyAccount()));
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
      body: Center(child: Text('hello')),
    );
  }
}

class Prescriptions extends StatefulWidget {
  @override
  _PrescriptionsState createState() => _PrescriptionsState();
}

class _PrescriptionsState extends State<Prescriptions> {

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    print('Prescription');
    return Scaffold(
      appBar: AppBar(title: Text('Prescriptions')),
      body: Column(
        children: <Widget>[
          RaisedButton.icon(
            label: _image == null
                ? Text('Add a new prescription')
                : Text('Prescription added'),
            icon: Icon(Icons.add_a_photo),
            onPressed: _getImage,
          ),
          Container(
            child: Image.file(
              _image,
              height: 200,
              width: 200,
            ),
          ),
        ],
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
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
            ),
            ListTile(
              title: Text('Medicines'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Medicines()));
              },
            ),
            ListTile(
              title: Text('Reminders'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Reminders()));
              },
            ),
            ListTile(
              title: Text('Blood Pressure'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BloodPressure()));
              },
            ),
            ListTile(
              title: Text('Sugar'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Sugar()));
              },
            ),
            ListTile(
              title: Text('Contacts'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
=======
>>>>>>> 6753d03f049d681d270eb20541a4dc53882bebef

    return Scaffold(
      body: AddPrescription(),
    );
  }
<<<<<<< HEAD

  Future _getImage() async {
    //PickedFile image = await _picker.getImage(source: ImageSource.gallery);
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      print('_image: $_image');
    });
  }
=======
>>>>>>> 6753d03f049d681d270eb20541a4dc53882bebef
}

class Reminders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Reminders');
    return Scaffold(
      appBar: AppBar(title: Text('Mediminder')),
      body: Center(
        child: RaisedButton(
          child: Text('Add a new Mediminder'),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyMedicineRemainder()));
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
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
            ),
            ListTile(
              title: Text('Medicines'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Medicines()));
              },
            ),
            ListTile(
              title: Text('Prescriptions'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Prescriptions()));
              },
            ),
            ListTile(
              title: Text('Blood Pressure'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BloodPressure()));
              },
            ),
            ListTile(
              title: Text('Sugar'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Sugar()));
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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MyAccount()));
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
      body: Center(child: Text('heyyy')),
    );
  }
}

class MyMedicineRemainder extends StatefulWidget {
  MyMedicineRemainder();

  @override
  _MyMedicineReminder createState() => _MyMedicineReminder();
}

class _MyMedicineReminder extends State<MyMedicineRemainder> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    MedicineModel model;
    return ScopedModel<MedicineModel>(
      model: model = MedicineModel(),
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              buildBottomSheet(deviceHeight, model);
            },
            child: Icon(
              Icons.add,
              size: 40,
              color: Colors.white,
            ),
            backgroundColor: Theme.of(context).accentColor,
          ),
          body: SafeArea(
            child: Column(
              children: <Widget>[
                MyAppBar(greenColor: Theme.of(context).primaryColor),
                Expanded(
                  child: ScopedModelDescendant<MedicineModel>(
                    builder: (context, child, model) {
                      return Stack(children: <Widget>[
                        buildMedicinesView(model),
                        (model.getCurrentIconState() == DeleteIconState.hide)
                            ? Container()
                            : DeleteIcon()
                      ]);
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }

  FutureBuilder buildMedicinesView(model) {
    return FutureBuilder(
      future: model.getMedicineList(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data);
          if (snapshot.data.length == 0) {
            // No data
            return Center(child: MedicineEmptyState());
          }
          return MedicineGridView(snapshot.data);
        }
        return (Container());
      },
    );
  }

  void buildBottomSheet(double height, MedicineModel model) async {
    var medicineId = await showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45), topRight: Radius.circular(45))),
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return FadeAnimation(
            .6,
            AddMedicine(height, model.getDatabase(), model.notificationManager),
          );
        });

    if (medicineId != null) {
      Fluttertoast.showToast(
          msg: "Mediminder was added!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Theme.of(context).accentColor,
          textColor: Colors.white,
          fontSize: 20.0);

      setState(() {});
    }
  }
}

class BloodPressure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Blood Pressure')),
      body: ListView(
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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Medicines()));
              },
            ),
            ListTile(
              title: Text('Reminders'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Reminders()));
              },
            ),
            ListTile(
              title: Text('Prescriptions'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Prescriptions()));
              },
            ),
            ListTile(
              title: Text('Sugar'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Sugar()));
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

class Sugar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sugar')),
      body: ListView(
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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Medicines()));
              },
            ),
            ListTile(
              title: Text('Reminders'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Reminders()));
              },
            ),
            ListTile(
              title: Text('Prescriptions'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Prescriptions()));
              },
            ),
            ListTile(
              title: Text('Blood Pressure'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BloodPressure()));
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
          onPressed: () async {
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
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
            ),
            ListTile(
              title: Text('Medicines'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Medicines()));
              },
            ),
            ListTile(
              title: Text('Reminders'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Reminders()));
              },
            ),
            ListTile(
              title: Text('Prescriptions'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Prescriptions()));
              },
            ),
            ListTile(
              title: Text('Blood Pressure'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BloodPressure()));
              },
            ),
            ListTile(
              title: Text('Sugar'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Sugar()));
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
