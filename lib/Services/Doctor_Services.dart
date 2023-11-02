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
                  specialization: doctor['specialization'],
                  email: doctor['email'],
                  rating: doctor['rating'],
                  reg_fee: doctor['reg_fee'],
                  sitting_days: doctor['sitting_days'],
                  city: doctor['city'],
                  experience: doctor['experience'],
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

          print(accToSearch[i].city);
          print(accToSearch[i]);
        }

        return accToSearch;
      } else {
        print('No Doctors found for $doctorType in city $city');
        accToSearch.clear();
        return null;
      }
    } catch (e) {
      print('Error retrieving doctors: $e');
    }
    return null;
  }

/*
when the appointment is booked it should send notification to the respective
 doctor with doctorId and that slot of that date should be marked as booked*/

  Future<void> BookAppointment(
      context, String doc_category, Appointment_Model appointment) async {
    try {
      final firestore = FirebaseFirestore.instance;

      final appointmentRef = firestore.collection('Appointments').doc();

      // Store the appointment details in the 'Appointments' collection
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

      // Get the appointment ID from the newly created document
      final appointmentId = appointmentRef.id;

      // Check availability in the 'Dentists' Collection
      final dentistRef =
          firestore.collection(doc_category).doc(appointment.doctorId);
      final dentistDoc = await dentistRef.get();

      if (dentistDoc.exists) {
        final dentistData = dentistDoc.data();

        if (dentistData!['Bookings'] != null) {
          final bookingMap = dentistData['Bookings'];

          if (bookingMap[appointment.date_for_booking] != null) {
            final slot =
                bookingMap[appointment.date_for_booking][appointment.slot];

            if (slot != null) {
              // Slot already booked, delete the appointment document
              await appointmentRef.delete();
              print(
                  'Slot already booked by someone. Appointment document deleted.');
            } else {
              // Slot is available, add the appointment
              bookingMap[appointment.date_for_booking][appointment.slot] =
                  appointmentId;
              await dentistRef.update({'Bookings': bookingMap});
              print('Appointment booked successfully.');
            }
          } else {
            // Slot not found for the given date, create a new slot
            bookingMap[appointment.date_for_booking] = {
              appointment.slot: appointmentId
            };
            await dentistRef.update({'Bookings': bookingMap});
            print('Appointment booked successfully.');
          }
        } else {
          // 'Booking' field not found, create it and add the appointment
          final newBooking = {
            appointment.date_for_booking: {appointment.slot: appointmentId},
          };
          await dentistRef
              .set({'Bookings': newBooking}, SetOptions(merge: true));
          print('Appointment booked successfully.');
        }
      } else {
        print('Dentist not found.');
      }
    } catch (e) {
      print('Error in Appointment Booking: $e');
    }
  }

  //Slots Service

  Future<List<String>?> checkAvailableSlots(
      context,
      String docId,
      String targetDate,
      List<String> possibleSlots,
      String doc_category) async {
    try {
      DocumentSnapshot dentistDoc = await FirebaseFirestore.instance
          .collection(doc_category)
          .doc(docId)
          .get();
      Map<String, dynamic> bookingsData =
          dentistDoc.data() as Map<String, dynamic>;

      if (bookingsData.containsKey('Bookings')) {
        if (bookingsData['Bookings'][targetDate] != null) {
          Map<String, dynamic> bookings = bookingsData['Bookings'][targetDate];
          List<String> allSlots = bookings.keys.toList();
          List<String> availableSlots =
              possibleSlots.where((slot) => !allSlots.contains(slot)).toList();
          return availableSlots;
        }
      } else {
        return possibleSlots;
      }
    } catch (e) {
      print('Error is   This Ritesh  $e');
    }
    return null;
  }
}
