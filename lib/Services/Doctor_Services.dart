import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_search/Models/Appointment_Model.dart';
import 'package:doc_search/Models/Doctor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  void showToastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  Future<int> BookAppointment(
      context, String doc_category, Appointment_Model appointment) async {
    try {
      final firestore = FirebaseFirestore.instance;

      final appointmentRef = firestore.collection('Appointments').doc();

      // Store the appointment details in the 'Appointments' collection
      await appointmentRef.set({
        'doctor_name': appointment.doctor_name,
        'doctor_address': appointment.doctor_address,
        'doctor_qualification': appointment.doctor_qualification,
        'date_for_booking': appointment.date_for_booking,
        'doctorId': appointment.doctorId,
        'fee': appointment.reg_fee,
        'mode_of_payment': appointment.mode_of_payment,
        'paid': appointment.paid,
        'self': appointment.self,
        'slot': appointment.slot,
        'userId': appointment.userId,
        'timestamp': FieldValue.serverTimestamp(),
        'bookedFor': appointment.name
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
              showToastMessage(
                  'This slot is booked by someone else\nPlease Select another slot');
              print(
                  'Slot already booked by someone. Appointment document deleted.');
              return 0;
            } else {
              // Slot is available, add the appointment
              bookingMap[appointment.date_for_booking][appointment.slot] =
                  appointmentId;
              await dentistRef.update({'Bookings': bookingMap});
              try {
                await addOrUpdateAppointment(appointment.userId,
                    appointment.date_for_booking, appointmentId);
              } catch (e) {
                print(e);
              }
              print('Appointment booked successfully.');
              return 1;
            }
          } else {
            // Slot not found for the given date, create a new slot
            bookingMap[appointment.date_for_booking] = {
              appointment.slot: appointmentId
            };
            await dentistRef.update({'Bookings': bookingMap});
            try {
              await addOrUpdateAppointment(appointment.userId,
                  appointment.date_for_booking, appointmentId);
            } catch (e) {
              print(e);
            }
            print('Appointment booked successfully.');
            return 1;
          }
        } else {
          // 'Booking' field not found, create it and add the appointment
          final newBooking = {
            appointment.date_for_booking: {appointment.slot: appointmentId},
          };
          await dentistRef
              .set({'Bookings': newBooking}, SetOptions(merge: true));

          try {
            await addOrUpdateAppointment(appointment.userId,
                appointment.date_for_booking, appointmentId);
          } catch (e) {
            print(e);
          }
          print('Appointment booked successfully.');
          return 1;
        }
      } else {
        print('Dentist not found.');
      }
    } catch (e) {
      print('Error in Appointment Booking: $e');
      return -1;
    }
    return -1;
  }

  Future<void> addOrUpdateAppointment(
      String uid, String key, dynamic value) async {
    final firestoreInstance = FirebaseFirestore.instance;

    await firestoreInstance
        .collection('Users')
        .doc(uid)
        .get()
        .then((documentSnapshot) {
      if (documentSnapshot.exists) {
        // Get the existing appointments map from the document
        Map<String, dynamic> appointments =
            documentSnapshot.data()!['apointments'] ?? {};

        // Check if the key already exists in the map
        if (appointments.containsKey(key)) {
          // If the key exists, add the value to the existing array
          List<dynamic> existingValue = appointments[key] as List<dynamic>;
          existingValue.add(value);
          appointments[key] = existingValue;
        } else {
          // If the key does not exist, create a new key with the value in an array
          appointments[key] = [value];
        }

        // Update the appointments map in the Firestore document
        firestoreInstance.collection('Users').doc(uid).update({
          'apointments': appointments,
        }).then((_) {
          print('Appointment added/updated successfully');
        }).catchError((error) {
          print('Error updating document: $error');
        });
      } else {
        print('Document does not exist');
      }
    });
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
