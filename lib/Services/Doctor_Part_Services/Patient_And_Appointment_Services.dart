import 'package:cloud_firestore/cloud_firestore.dart';

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
}
