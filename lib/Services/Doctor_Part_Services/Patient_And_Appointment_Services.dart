import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_search/Models/Models_For_Patient_Part/Doctor.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Patient_And_Appointment_Services {
  Future<List<String>> getAllTimeSlotsForDates(context, String docId) async {
    final firestore = FirebaseFirestore.instance;
    List<String> allTimeSlots = [];

    try {
      final docSnapshot =
          await firestore.collection('Dentist').doc(docId).get();
      if (docSnapshot.exists) {
        final bookings =
            docSnapshot.data()?['Bookings'] as Map<String, dynamic>?;
        if (bookings != null) {
          for (var date in bookings.keys) {
            final dateValues = bookings[date] as Map<String, dynamic>;
            for (var timeSlot in dateValues.keys) {
              allTimeSlots.add(dateValues[timeSlot]);
            }
          }
        }
      }
    } catch (e) {
      print("Error retrieving time slots: $e");
    }
    print(allTimeSlots);
    return allTimeSlots;
  }

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Doctor?> DoctorsDetails(context, String doctorType) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection(doctorType)
          .doc(_auth.currentUser!.uid)
          .get();

      if (documentSnapshot.exists) {
        Map<dynamic, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        Doctor user = Doctor(
            specialization: data['specialization'],
            email: data['email'],
            rating: data['rating'],
            reg_fee: data['reg_fee'],
            sitting_days: data['sitting_days'],
            city: data['city'],
            experience: data['experience'],
            name: data['name'],
            pincode: data['pin_code'],
            address: data['address']);

        print(user.name);
        print(user.city);
        print(user.email);

        return user;
      } else {
        // Handle the case where the document with the given mobile number doesn't exist.
        return null;
      }
    } catch (e) {
      print('Error retrieving doctors: $e');
    }
    return null;
  }
}
