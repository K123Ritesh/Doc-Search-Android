import 'package:doc_search/Models/Appointment_Model.dart';
import 'package:doc_search/Services/Doctor_Services.dart';
import 'package:flutter/foundation.dart';

import '../Models/Doctor.dart';

class Doctor_Provider with ChangeNotifier {
  List<Doctor>? acc_to_search = [];
  bool isLoading = false;

  Doctor_Services service = Doctor_Services();
  getDocByCity(context, String city, String doctor_type) async {
    isLoading = true;
    acc_to_search = await service.doctorsByCity(context, city, doctor_type);
    isLoading = false;

    notifyListeners();
  }

  int status = -1;

  bookAppointment(
      context, Appointment_Model appointment, String doc_category) async {
    status = await service.BookAppointment(context, doc_category, appointment);
    notifyListeners();
  }

  List<String>? availableSlots = [];
  knowAvailableSlots(context, String docId, String targetDate,
      List<String> possibleSlots, String doc_category) async {
    availableSlots = await service.checkAvailableSlots(
        context, docId, targetDate, possibleSlots, doc_category);
    notifyListeners();
  }
}
