import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:saathi/models/prescription.dart';


class DatabaseService {
  final String uid;
  DatabaseService({ this.uid });
  final firestoreInstance = Firestore.instance;


  final CollectionReference userDetailsCollection = Firestore.instance.collection('user details');
  final CollectionReference prescriptionCollection = Firestore.instance.collection('prescription');
  final CollectionReference bpCollection = Firestore.instance.collection('bp');
  final CollectionReference sugarCollection = Firestore.instance.collection('sugar');

  Future<void> updateUserData(String name, String age, String bloodGroup, String emergencyContact1, String emergencyContact2) async {
    return await userDetailsCollection.document(uid).setData({
      'name': name,
      'age': age,
      'blood group': bloodGroup,
      'emergency contact 1': emergencyContact1,
      'emergency contact 2': emergencyContact2,
    });
  }

  Future<void> setPrescription(File image) async {
    return await prescriptionCollection.document(uid).setData({
      'image': image,
    });
  }

  Future<void> addPrescription(File image) async {
    return await prescriptionCollection.document(uid).updateData({
      'image': image,
    });
  }

  Future<void> addBP(String bps, String bpd, String dateStr) async {
    return await bpCollection.document(uid).setData({
      'bps': bps,
      'bpd': bpd,
      'date' : dateStr,
    },
    merge: true);
  }

  Future<void> addSugar(String sugarb, String sugara, String dateStr) async {
    return await sugarCollection.document(uid).setData({
      'sugarb': sugarb,
      'sugara': sugara,
      'date' : dateStr,
    },
        merge: true);
  }

  void getBP() async {
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    firestoreInstance.collection("bp").document(firebaseUser.uid).get().then((value){
      print(value.data);
    });
  }

  void getSugar() async {
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    firestoreInstance.collection("sugar").document(firebaseUser.uid).get().then((value){
      print(value.data);
    });
  }

}