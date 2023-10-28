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

  bookAppointment(context, Appointment_Model appointment) async {
    await service.BookAppointment(context, appointment);
    notifyListeners();
  }
}
