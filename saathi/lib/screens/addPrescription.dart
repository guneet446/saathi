import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saathi/services/database.dart';

class AddPrescription extends StatefulWidget {
  @override
  _AddPrescriptionState createState() => _AddPrescriptionState();
}

class _AddPrescriptionState extends State<AddPrescription> {

  File _image;

  @override
  Widget build(BuildContext context) {

      return Center(
        child: Column(
          children: <Widget>[
            Container(height: 30),
            RaisedButton.icon(
              label: Text('Add a new prescription'),
              icon: Icon(Icons.add_a_photo),
              onPressed: _getImage,
            ),
            Container(height: 10),
            Container(
              child: Image.file(
                _image,
                height: 500,
                width: 400,
              ),
            ),
          ],
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
