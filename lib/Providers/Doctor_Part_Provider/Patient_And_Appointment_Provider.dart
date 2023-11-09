import 'package:doc_search/Models/Models_For_Patient_Part/Doctor.dart';
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

  String acc_to_search = '';

  getAcctoSearch(context, String input) {
    for (int i = 0; i < allAppoitmentList.length; i++) {
      if (input == allAppoitmentList[i]) {
        acc_to_search = input;
      }
    }
    notifyListeners();
  }

  Doctor? myDetails;

  getMyDetails(context, String doctor_type) async {
    myDetails = await service.DoctorsDetails(context, doctor_type);
    notifyListeners();
  }

  // getApointmentDetail(context) {}
  // String? uid;
  // getUserDetails(context) {}
}
