import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_search/Models/User_Model.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  Future<PatientUser?> UserAllDetails(String uid) async {
    try {
      DocumentSnapshot documentSnapshot =
          await FirebaseFirestore.instance.collection("Users").doc(uid).get();

      if (documentSnapshot.exists) {
        Map<dynamic, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        PatientUser user = PatientUser(
          email: data['email'],
          firstName: data['firstName'],
          lastName: data['lastName'],
          mobileNo: data['mobileNumber'],
          city: data['city'],
          appointments: data['apointments'],
        );

        print(user.appointments);
        print(user.city);
        print(user.email);
        print(user.mobileNo);
        print('${user.firstName} ${user.lastName}');

        return user;
      } else {
        // Handle the case where the document with the given mobile number doesn't exist.
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  List<String>? getTodayAppointmentIds(context, Map<String, dynamic>? data) {
    if (data == null) return null;

    final today = DateTime.now();
    final todayKey = "${today.day}/${today.month}/${today.year}";

    List<String> todayAppointmentIds = [];

    data.forEach((key, value) {
      if (key == todayKey) {
        todayAppointmentIds
            .addAll(value.map<String>((item) => item.toString()));
      }
    });

    return todayAppointmentIds.isNotEmpty ? todayAppointmentIds : null;
  }

  Future<void> storePhoneNumber(context, String phoneNo) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
        'mobNo', phoneNo); // You can store other types of data as well.
  }

  Future<String> getMobileNo(context) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString('mobNo');
    return value == null ? ' ' : value;
  }
}
