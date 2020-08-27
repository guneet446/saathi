import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class DatabaseService {
  final String uid;
  DatabaseService({ this.uid });

  final CollectionReference userDetailsCollection = Firestore.instance.collection('user details');
  final CollectionReference prescriptionCollection = Firestore.instance.collection('prescription');

  Future<void> updateUserData(String name, String age, String bloodGroup, String emergencyContact1, String emergencyContact2) async {
    return await userDetailsCollection.document(uid).setData({
      'name': name,
      'age': age,
      'blood group': bloodGroup,
      'emergency contact 1': emergencyContact1,
      'emergency contact 2': emergencyContact2,
    });
  }

  Future<void> setPrescription(PickedFile image) async {
    return await prescriptionCollection.document(uid).setData({
      'image': image,
    });
  }

  Future<void> addPrescription(PickedFile image) async {
    return await prescriptionCollection.document(uid).updateData({
      'image': image,
    });
  }

  Stream<QuerySnapshot> get prescriptions {
    return prescriptionCollection.snapshots();
  }
}