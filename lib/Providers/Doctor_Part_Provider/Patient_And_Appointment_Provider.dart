import 'dart:io';
import 'package:doc_search/Models/Models_for_Doctor_Part/Doctors.dart';
import 'package:doc_search/Services/Doctor_Part_Services/Patient_And_Appointment_Services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../Models/Models_For_Patient_Part/Appointment_Model.dart';
import '../../Models/Models_For_Patient_Part/User_Model.dart';

class Patient_And_Appointment_Provider with ChangeNotifier {
  Patient_And_Appointment_Services service = Patient_And_Appointment_Services();
  List<String> allAppoitmentList = [];
  FirebaseAuth _auth = FirebaseAuth.instance;

  getAllAppointment(context, String docId, String doc_category) async {
    allAppoitmentList =
        await service.getAllTimeSlotsForDates(context, doc_category, docId);
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

  PatientUser? appointmentedUser;
  Appointment_Model? appointmentDetails;
  getDetailsOfAppointment(context, String search) async {
    appointmentDetails = await service.AppointmentDetail(context, search);
    print('user uid --> ${appointmentDetails!.userId}');
    appointmentedUser = appointmentedUser =
        await service.UserAllDetails(appointmentDetails!.userId);
    notifyListeners();
  }

  getUserDetailsforAppointment(context) async {
    appointmentedUser =
        await service.UserAllDetails(appointmentDetails!.userId);
    notifyListeners();
  }

  Doctor_Part_Model? myDetails;

  getMyDetails(context, String doctor_type) async {
    myDetails = await service.DoctorsDetails(context, doctor_type);
    notifyListeners();
  }

  uploadImage(context, File file, String userId, String category) async {
    await service.uploadProfilePic(context, category, file, userId);
    notifyListeners();
  }

  updateProfile(context, String category, String userId,
      Map<String, dynamic> updatedData) async {
    await service.createOrUpdateFields(context, category, userId, updatedData);
    notifyListeners();
  }
}
