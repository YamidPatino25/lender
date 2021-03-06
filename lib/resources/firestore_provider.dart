import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreProvider {
  Firestore _firestore = Firestore.instance;
  Future<Null> saveUserData(FirebaseUser user) async {    
    await _firestore.collection("users").document(user.uid).setData({
      "email": user.email,
      "name": user.displayName,
    });
  }

  Stream<QuerySnapshot> borrowed(String uid) {
    return _firestore.collection("users")
      .document(uid)
      .collection('borrowed')
      .snapshots();
  }

  Stream<QuerySnapshot> lent(String uid) {
    return _firestore.collection("users")
      .document(uid)
      .collection('lent')
      .snapshots();
  }

  Future<DocumentReference> addItem(Map<String,dynamic> item, String type, String uid) {
    item["returned"] = false;
    return _firestore.collection('users')
      .document(uid)
      .collection(type)
      .add(item);
  }

  Future<void> updateItem(String itemId, Map<String,dynamic> update, String type, String uid) {
    return _firestore.collection('users')
      .document(uid)
      .collection(type)
      .document(itemId)
      .setData(update,merge: true);
  }

  Future<void> deleteItem(String itemId, String type, String uid) {
    return _firestore.collection('users')
      .document(uid)
      .collection(type)
      .document(itemId).delete();
  }

}