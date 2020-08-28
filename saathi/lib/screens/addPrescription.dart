import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saathi/models/user.dart';
import 'package:saathi/main.dart';
import 'package:saathi/services/database.dart';

class AddPrescription extends StatefulWidget {
  @override
  _AddPrescriptionState createState() => _AddPrescriptionState();
}

class _AddPrescriptionState extends State<AddPrescription> {

  File _image;

  @override
  Widget build(BuildContext context) {

    /*final prescriptions = Provider.of<List<Prescriptions>>(context);
    prescriptions.forEach((prescription) {
      print('prescription: $prescription');
    });*/

    return Scaffold(
      appBar: AppBar(title: Text('Prescriptions')),
      body: Column(
        children: <Widget>[
          RaisedButton.icon(
            label: _image == null ? Text('Add a new prescription') : Text(
                'Prescription added'),
            icon: Icon(Icons.add_a_photo),
            onPressed: _getImage,
          ),
          Container(
            child: Image.file(
              _image,
              height: 300,
              width: 300,
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

  final FirebaseAuth auth = FirebaseAuth.instance;

  void inputData() async {
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;
    print(uid);
    await DatabaseService(uid: uid).addPrescription(_image);
  }

    Future _getImage() async {
      File image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
        print('_image: $_image');
        inputData();
      });
    }


}
