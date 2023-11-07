import 'package:doc_search/Services/Doctor_Part_Services/Patient_And_Appointment_Services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class Patient_And_Appointment_Provider with ChangeNotifier {
  Patient_And_Appointment_Services service = Patient_And_Appointment_Services();
  List<String> allAppoitmentList = [];
  FirebaseAuth _auth = FirebaseAuth.instance;

  getAllAppointment(context, String docId) async {
    allAppoitmentList = await service.getAllTimeSlotsForDates(context, docId);
    notifyListeners();
  }

  getAcctoSearch(context, String input) {}
}
