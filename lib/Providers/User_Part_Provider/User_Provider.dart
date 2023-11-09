import 'dart:io';

import 'package:doc_search/Models/Models_For_Patient_Part/Appointment_Model.dart';
import 'package:doc_search/Models/Models_For_Patient_Part/User_Model.dart';
import 'package:doc_search/Services/User_Part_Services/User_Services.dart';
import 'package:flutter/material.dart';

class User_Provider with ChangeNotifier {
  UserServices userServices = UserServices();

  List<String> todayAppointmentId = [];
  List<String> pastAppointmentId = [];
  List<String> upcomingAppointmentId = [];
  PatientUser user = PatientUser(
      email: '',
      firstName: 'firstName',
      lastName: 'lastName',
      mobileNo: 'mobileNo',
      city: 'city',
      profilePicUrl: ' ',
      appointments: {},
      address: ' ',
      age: ' ',
      bloodGrp: ' ',
      landmark: ' ',
      pincode: ' ',
      profession: ' ',
      gender: ' ',
      activity_level: ' ',
      alcohol_consumption: ' ',
      allergies: ' ',
      chronic_diseases: ' ',
      current_medictaion: ' ',
      food_prefrencce: ' ',
      injuries: ' ',
      past_medication: ' ',
      smoking_habits: ' ',
      surgeries: ' ');
  bool isLoadingDetails = false;

  getUserDetails(context, String uid) async {
    isLoadingDetails = true;
    user = await userServices.UserAllDetails(uid) ?? user;
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

  bool isLoadingTodayAppointmentModel = false;
  bool isLoadingPastAppointmentModel = false;
  bool isLoadingUpcomingAppointmentModel = false;

  List<Appointment_Model> todayAppointmentModel = [];
  List<Appointment_Model> pastAppointmentModel = [];
  List<Appointment_Model> upcomingAppointmentModel = [];

  getTodayAppointmentModels(context) async {
    isLoadingTodayAppointmentModel = true;
    todayAppointmentModel =
        await userServices.AppointmentsList(context, todayAppointmentId);
    isLoadingTodayAppointmentModel = false;
    notifyListeners();
  }

  getPastAppointmentModels(context) async {
    isLoadingPastAppointmentModel = true;
    pastAppointmentModel =
        await userServices.AppointmentsList(context, pastAppointmentId);
    isLoadingPastAppointmentModel = false;
    notifyListeners();
  }

  getUpcomingAppointmentModels(context) async {
    isLoadingUpcomingAppointmentModel = true;
    upcomingAppointmentModel =
        await userServices.AppointmentsList(context, upcomingAppointmentId);
    isLoadingUpcomingAppointmentModel = false;
    notifyListeners();
  }

  // String? profilePicUrl;
  uploadImage(context, File file, String userId) async {
    await userServices.uploadProfilePic(context, file, userId);
    notifyListeners();
  }

  updateProfile(
      context, String userId, Map<String, dynamic> updatedData) async {
    await userServices.createOrUpdateFields(context, userId, updatedData);
    notifyListeners();
  }
}
