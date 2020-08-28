import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saathi/models/prescription.dart';


class DatabaseService {
  final String uid;
  DatabaseService({ this.uid });

  final CollectionReference userDetailsCollection = Firestore.instance.collection('user details');
  final CollectionReference prescriptionCollection = Firestore.instance.collection('prescription');
  final CollectionReference bpCollection = Firestore.instance.collection('bp');

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
    return await prescriptionCollection.document(uid).setData({
      'image': image,
    },
    merge: true);
  }

  Future<void> addBp(String bps, String bpd) async {
    return await bpCollection.document(uid).setData({
      'bps': bps,
      'bpd': bpd,
    },
    merge: true);
  }

  /*File image;
  List<Prescription> _prescriptionListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      //print(doc.data);
      return Prescription(
          image: doc.data[image] ?? null,
      );
    }).toList();
  }

  Stream<List<Prescription>> get prescription {
    return prescriptionCollection.snapshots()
        .map(_prescriptionListFromSnapshot);
  }*/

}