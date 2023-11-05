import 'package:doc_search/Models/Appointment_Model.dart';
import 'package:doc_search/Models/User_Model.dart';
import 'package:doc_search/Services/User_Services.dart';
import 'package:flutter/material.dart';

class User_Provider with ChangeNotifier {
  UserServices userServices = UserServices();

  List<String> todayAppointmentId = ['NuLL'];
  List<String> pastAppointmentId = [];
  List<String> upcomingAppointmentId = [];
  PatientUser user = PatientUser(
      email: '',
      firstName: 'firstName',
      lastName: 'lastName',
      mobileNo: 'mobileNo',
      city: 'city',
      appointments: {});
  bool isLoadingDetails = false;

  getUserDetails(context, String uid) async {
    isLoadingDetails = true;
    user = (await userServices.UserAllDetails(uid))!;
    isLoadingDetails = false;

    notifyListeners();
  }

  getTodayAppointments(context) {
    todayAppointmentId = userServices.categorizeDatesAndValues(
        context, user.appointments, 'Today');
    notifyListeners();
  }

  getPastAppointments(context) {
    pastAppointmentId = userServices.categorizeDatesAndValues(
        context, user.appointments, 'Past');
    notifyListeners();
  }

  getUpcomingAppointments(context) {
    upcomingAppointmentId = userServices.categorizeDatesAndValues(
        context, user.appointments, 'Future');
    notifyListeners();
  }

  List<Appointment_Model> todayAppointmentModel = [];

  getTodayAppointmentModels(context) async {
    todayAppointmentModel =
        await userServices.AppointmentsList(context, todayAppointmentId);

    notifyListeners();
  }
}
