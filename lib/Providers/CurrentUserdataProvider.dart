import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataProvider extends ChangeNotifier {
  String? fcmtoken;
  String? add;
  String? bgroup;
  String? doj;
  String? econtact;
  String? gender;
  String? udesignation;
  String? username;
  String? email;
  String? phone;
  String? imageUrl;
  String? role;
  String? uid;
  int? eid;

  Future<void> getUserData() async {
    try {
      FirebaseFirestore _firebasefirestore = FirebaseFirestore.instance;
      FirebaseAuth _auth = FirebaseAuth.instance;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var uid = prefs.getString("uid");
      await _firebasefirestore
          .collection("EmployeeData")
          .doc(uid)
          .get()
          .then((value) {
        //print(value.data());
        fcmtoken = value.get("fcmtoken");
        add = value.get("add");
        bgroup = value.get("bgroup");
        doj = value.get("doj");
        econtact = value.get("econtact");
        udesignation = value.get("udesignation");
        gender = value.get("gender");
        username = value.get("uname");
        email = value.get("uemail");
        phone = value.get("uphoneNumber");
        imageUrl = value.get("uimage");
        role = value.get("urole");
        eid = value.get("eid");
        notifyListeners();
      });
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}