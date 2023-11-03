import 'package:doc_search/Models/User_Model.dart';
import 'package:doc_search/Services/User_Services.dart';
import 'package:flutter/material.dart';

class User_Provider with ChangeNotifier {
  UserServices userServices = UserServices();

  List<dynamic>? todayAppointmentId;
  List<dynamic>? pastAppointmentId;
  List<dynamic>? upcomingAppointmentId;

  late PatientUser? user;
  bool isLoadingDetails = false;

  getUserDetails(context, String phoneNo) async {
    isLoadingDetails = true;
    user = await userServices.UserAllDetails(phoneNo);
    isLoadingDetails = false;

    notifyListeners();
  }

  savePhoneNo(context, String phoneNo) async {
    await userServices.storePhoneNumber(context, phoneNo);
  }

  String phoneNo = '+919905411917';
  getPhoneNo(context) async {
    phoneNo = await userServices.getMobileNo(context);
  }
}
