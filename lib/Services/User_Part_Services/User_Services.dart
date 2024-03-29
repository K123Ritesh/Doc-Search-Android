import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_search/Models/Models_For_Patient_Part/User_Model.dart';
import 'package:doc_search/Models/Models_For_Patient_Part/Order_Model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:core';

import '../../Models/Models_For_Patient_Part/Appointment_Model.dart';

class UserServices {
  Future<PatientUser?> UserAllDetails(String uid) async {
    try {
      DocumentSnapshot documentSnapshot =
          await FirebaseFirestore.instance.collection("Users").doc(uid).get();

      if (documentSnapshot.exists) {
        Map<dynamic, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        PatientUser user = PatientUser(
            orders: data['orders'],
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
            activity_level: data['activity_level'],
            alcohol_consumption: data['alcohol_consumption'],
            allergies: data['allergies'],
            chronic_diseases: data['chronic_diseases'],
            current_medictaion: data['current_medication'],
            food_prefrencce: data['food_prefrence'],
            injuries: data['injuries'],
            past_medication: data['past_medication'],
            smoking_habits: data['smoking_habits'],
            surgeries: data['surgeries']);

        print(user.appointments);
        print(user.city);
        print(user.email);
        print(user.mobileNo);
        print('${user.firstName} ${user.lastName}');
        print(user.profilePicUrl);
        print(user.orders);

        return user;
      } else {
        // Handle the case where the document with the given mobile number doesn't exist.
        return null;
      }
    } catch (e) {
      print('Error in this: $e');
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
      // if (listResult.items.length == 1) {
      //   // Delete the existing file
      // }
      for (int i = 0; i < listResult.items.length; i++) {
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

  Future<Order_Model?> OrderDetails(context, String orderId) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection("Orders")
          .doc(orderId)
          .get();

      if (documentSnapshot.exists) {
        Map<dynamic, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        print(data['deliveryStatus']);
        print(data['prescription_url']);
        print(data['shopName']);
        return Order_Model(
            Status: data['deliveryStatus'],
            presciptionUrl: data['prescription_url'],
            shopName: data['shopName']);
      } else {
        return null;
      }
    } catch (e) {
      print('Error in this: $e');
      return null;
    }
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // Function to retrieve the MedicineList from Firestore
  Future<List<Map<String, dynamic>>> getMedicineList(
      context, String docId) async {
    CollectionReference appointments = _firestore.collection('Appointments');

    // Get the document snapshot using the specified docId
    DocumentSnapshot<Map<String, dynamic>> snapshot = await appointments
        .doc(docId)
        .get() as DocumentSnapshot<Map<String, dynamic>>;

    // If the document exists, retrieve the MedicineList from the snapshot
    if (snapshot.exists) {
      List<Map<String, dynamic>> medicineList =
          List<Map<String, dynamic>>.from(snapshot.data()!['MedicineList']);
      return medicineList;
    } else {
      // Document does not exist
      return [];
    }
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> addFamilyMembers(
      context, List<Map<String, dynamic>> medicineList) async {
    CollectionReference appointments = _firestore.collection('Users');

    // Convert the List<Map<String, dynamic>> to List<Map<String, dynamic>> using toJson()
    List<Map<String, dynamic>> serializedList =
        medicineList.map((e) => e).toList();

    // Add or set the document with the specified docId
    await appointments
        .doc(_auth.currentUser!.uid)
        .set({'FamilyMemberList': serializedList}, SetOptions(merge: true));
  }

  Future<List<Map<String, dynamic>>> getFamilyMembersList(
    context,
  ) async {
    CollectionReference appointments = _firestore.collection('Users');

    // Get the document snapshot using the specified docId
    DocumentSnapshot<Map<String, dynamic>> snapshot = await appointments
        .doc(_auth.currentUser!.uid)
        .get() as DocumentSnapshot<Map<String, dynamic>>;

    // If the document exists, retrieve the MedicineList from the snapshot
    if (snapshot.exists) {
      List<Map<String, dynamic>> familymemberList =
          List<Map<String, dynamic>>.from(snapshot.data()!['FamilyMemberList']);
      return familymemberList;
    } else {
      // Document does not exist
      return [];
    }
  }
}
