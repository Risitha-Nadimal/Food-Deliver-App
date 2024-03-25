import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseControoler {
  //Firestore instense crated
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //create collection references
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  //save user inforamtion
  Future<void> saveUserInformation(
    String name,
    String email,
    String phoneNo,
  ) {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'name': name,
          'email': email,
          'phoneNo': phoneNo,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
