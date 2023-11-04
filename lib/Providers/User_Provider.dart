import 'package:doc_search/Models/User_Model.dart';
import 'package:doc_search/Services/User_Services.dart';
import 'package:flutter/material.dart';

class User_Provider with ChangeNotifier {
  UserServices userServices = UserServices();

  List<dynamic>? todayAppointmentId;
  List<dynamic>? pastAppointmentId;
  List<dynamic>? upcomingAppointmentId;
  PatientUser? user = PatientUser(
      email: '',
      firstName: 'firstName',
      lastName: 'lastName',
      mobileNo: 'mobileNo',
      city: 'city',
      appointments: {});
  bool isLoadingDetails = false;

  getUserDetails(context, String uid) async {
    isLoadingDetails = true;
    user = await userServices.UserAllDetails(uid);
    isLoadingDetails = false;

    notifyListeners();
  }
}
