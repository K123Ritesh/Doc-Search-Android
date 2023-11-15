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

  getAllAppointment(context, String doc_category) async {
    allAppoitmentList = await service.getAllTimeSlotsForDates(
        context, doc_category, _auth.currentUser!.uid);
    notifyListeners();
  }

  int acc_to_search = -1;

  getAcctoSearch(context, String input) {
    for (int i = 0; i < allAppoitmentList.length; i++) {
      if (input == allAppoitmentList[i]) {
        acc_to_search = i;
      }
    }
    notifyListeners();
  }

  List<PatientUser>? appointmentedUsers;
  List<Appointment_Model>? appointmentDetails;
  getDetailsOfAppointment(context) async {
    appointmentDetails =
        await service.AppointmentDetail(context, allAppoitmentList);
    ;
    //  print('user uid --> ${appointmentDetails![acc_to_search]!.userId}');
    List<String> uids = [];
    for (int i = 0; i < appointmentDetails!.length; i++) {
      uids.add(appointmentDetails![i].userId);
      print(uids[i]);
    }
    appointmentedUsers = await service.UserAllDetails(context, uids);
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

  uploadMedicineLists(context, String appointmentId,
      List<Map<String, dynamic>> medicineList) async {
    await service.storeMedicineList(context, appointmentId, medicineList);
    notifyListeners();
  }

  List<Map<String, dynamic>> medicineLists = [];
  getMedicineLists(context, String appointmentId) async {
    medicineLists = await service.getMedicineList(context, appointmentId);
    notifyListeners();
  }
}
