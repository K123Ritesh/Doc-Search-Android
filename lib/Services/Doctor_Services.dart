import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_search/Models/Appointment_Model.dart';
import 'package:doc_search/Models/Doctor.dart';
import 'package:get/get.dart';

class Doctor_Services {
  Future<List<Doctor>?> doctorsByCity(
      context, String city, String doctorType) async {
    List<Doctor> accToSearch = [];
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(doctorType)
          .where('city', isEqualTo: city.toLowerCase())
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        accToSearch.assignAll(
          querySnapshot.docs
              .map((doctor) => Doctor(
                  rating: doctor['rating'],
                  reg_fee: doctor['reg_fee'],
                  sitting_days: doctor['sitting_days'],
                  city: doctor['city'],
                  experience: doctor['experience'],
                  bookings_for_today: doctor['Bookings_for_today'],
                  name: doctor['name'],
                  pincode: doctor['pin_code'],
                  address: doctor['address']))
              .toList(),
        );
        for (int i = 0; i < accToSearch.length; i++) {
          print('${i + 1} th Doctor in the CITY');
          print(accToSearch[i].address);
          print(accToSearch[i].name);
          print(accToSearch[i].pincode);
          print(accToSearch[i].bookings_for_today);
          print(accToSearch[i].city);
          print(accToSearch[i]);
        }

        return accToSearch;
      } else {
        print('No Doctors found for pincode $city');
        accToSearch.clear();
        return null;
      }
    } catch (e) {
      print('Error retrieving doctors: $e');
    }
    return null;
  }

  Future<void> BookAppointment(context, Appointment_Model appointment) async {
    try {
      final firestore = FirebaseFirestore.instance;

      final appointmentRef = firestore.collection('Appointments').doc();

      await appointmentRef.set({
        'date_for_booking': appointment.date_for_booking,
        'doctorId': appointment.doctorId,
        'fee': appointment.reg_fee,
        'mode_of_payment': appointment.mode_of_payment,
        'paid': appointment.paid,
        'self': appointment.self,
        'slot': appointment.slot,
        'userId': appointment.userId,
        'timestamp': FieldValue.serverTimestamp(),
      });

      print('Appointment Booked successfully.');
    } catch (e) {
      print('Error in Appointment Booking: $e');
    }
  }
}
