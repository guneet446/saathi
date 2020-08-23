import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class DatabaseService {
  final String uid;
  DatabaseService({ this.uid });

  final CollectionReference userDetailsCollection = Firestore.instance.collection('user details');

  Future<void> updateUserData(String name, String age) async {
    return await userDetailsCollection.document(uid).setData({
      'name': name,
      'age': age,
    });
  }
}