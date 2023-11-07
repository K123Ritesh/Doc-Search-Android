import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_search/Models/User_Model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:core';

import '../Models/Appointment_Model.dart';

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
          profilePicUrl: data['profile_pic'],
          address: data['address'],
          age: data['age'],
          bloodGrp: data['bloodGroup'],
          landmark: data['landmark'],
          pincode: data['pincode'],
          profession: data['profession'],
          gender: data['gender'],
        );

        print(user.appointments);
        print(user.city);
        print(user.email);
        print(user.mobileNo);
        print('${user.firstName} ${user.lastName}');
        print(user.profilePicUrl);

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

  String compareDates(String inputDateStr) {
    // Split the input date string into day, month, and year
    List<String> dateParts = inputDateStr.split('/');
    if (dateParts.length != 3) {
      return 'Invalid date format';
    }

    int? day = int.tryParse(dateParts[0]);
    int? month = int.tryParse(dateParts[1]);
    int? year = int.tryParse(dateParts[2]);

    if (day == null || month == null || year == null) {
      return 'Invalid date format';
    }

    // Create a DateTime object for the input date
    DateTime inputDate = DateTime(year, month, day);

    // Get the current date and time
    DateTime currentDate = DateTime.now();

    DateTime oneDayBeforeToday = currentDate.subtract(Duration(days: 1));

    // Compare the dates
    if (inputDate.isBefore(oneDayBeforeToday)) {
      return 'Past';
    } else if (inputDate.isAfter(currentDate)) {
      return 'Future';
    } else {
      return 'Today';
    }
  }

  List<String> categorizeDatesAndValues(
      context, Map<String, dynamic>? dateMap, String category) {
    List<String> result = [];

    if (dateMap != null) {
      dateMap.forEach((key, value) {
        String dateCategory = compareDates(key);
        if (dateCategory == category && value is List) {
          result.addAll(value.cast<String>());
        }
      });
    }

    return result;
  }

  Future<List<Appointment_Model>> AppointmentsList(
      context, List<String> appointmentId) async {
    List<Appointment_Model> ans_list = [];

    try {
      final firestore = FirebaseFirestore.instance;

      for (int i = 0; i < appointmentId.length; i++) {
        final AppointmentRef =
            firestore.collection("Appointments").doc(appointmentId[i]);
        final AppointmentData = await AppointmentRef.get();

        if (AppointmentData.exists) {
          ans_list.add(Appointment_Model(
              name: AppointmentData['bookedFor'],
              doctor_name: AppointmentData['doctor_name'],
              doctor_address: AppointmentData['doctor_address'],
              doctor_qualification: AppointmentData['doctor_qualification'],
              date_for_booking: AppointmentData['date_for_booking'],
              mode_of_payment: AppointmentData['mode_of_payment'],
              self: AppointmentData['self'],
              reg_fee: AppointmentData['fee'],
              paid: AppointmentData['paid'],
              doctorId: AppointmentData['doctorId'],
              slot: AppointmentData['slot'],
              userId: AppointmentData['userId']));

          //Testing
          print('${i + 1} Appointment Detaills');
          print(AppointmentData['doctor_name']);
          print(AppointmentData['doctor_address']);
          print(AppointmentData['doctor_qualification']);
          print(AppointmentData['date_for_booking']);
          print(AppointmentData['mode_of_payment']);
          print(AppointmentData['self']);
          print(AppointmentData['fee']);
          print(AppointmentData['paid']);
          print(AppointmentData['doctorId']);
          print(AppointmentData['slot']);
          print(AppointmentData['userId']);
        } else {
          print('AppointmentId  not found.');
        }
      }
      return ans_list;
    } catch (e) {
      print('Error in Getting Appointment Details: $e');
    }
    return ans_list;
  }

  Future<void> createOrUpdateFields(
      context, String userId, Map<String, dynamic> updatedData) async {
    try {
      CollectionReference collectionRef =
          FirebaseFirestore.instance.collection('Users');
      DocumentReference docRef = collectionRef.doc(userId);

      await docRef.set(updatedData, SetOptions(merge: true));
      print('Updated the data');
    } catch (e) {
      print(e);
    }
  }

  Future<void> uploadProfilePic(context, File file, String userId) async {
    try {
      final folderPath = 'Users/$userId/image';

      // List the items in the folder
      final reference = FirebaseStorage.instance.ref(folderPath);
      ListResult listResult = await reference.list();

      // Check if there is exactly one item in the folder
      if (listResult.items.length == 1) {
        // Delete the existing file
        await listResult.items[0].delete();
      }

      // Upload the new file
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final storageReference =
          FirebaseStorage.instance.ref('$folderPath/$fileName');

      UploadTask uploadTask = storageReference.putFile(file);

      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => {});

      if (taskSnapshot.state == TaskState.success) {
        final downloadURL = await storageReference.getDownloadURL();
        final userRef =
            FirebaseFirestore.instance.collection('Users').doc(userId);
        await userRef.update({'profile_pic': downloadURL});

        return;
      } else {
        throw 'Failed to upload file.';
      }
    } catch (e) {
      print('Error uploading file and saving to Firestore: $e');
      throw e;
    }
  }
}
