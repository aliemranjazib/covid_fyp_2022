import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:covid_plasma_fyp/models/donormodel.dart';
// import 'package:covid_plasma_fyp/models/oxygenpostmodel.dart';
import 'package:flutter_application_covid/model/donormodel.dart';

class DatabaseMethod {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future uploadDonor(DonorModel donorModel) async {
    var userMap = donorModel.toMap();
    try {
      await db.collection("plasmaDonors").doc(donorModel.phone).set(userMap);
      print("Done");
    } catch (e) {
      print(e.toString());
    }
  }

  Stream<QuerySnapshot> getDonors({required String pin}) {
    return db
        .collection("plasmaDonors")
        .where("pin", isEqualTo: pin)
        .snapshots();
  }
}
