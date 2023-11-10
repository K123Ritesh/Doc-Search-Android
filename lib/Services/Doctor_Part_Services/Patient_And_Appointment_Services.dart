import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_search/Models/Models_for_Doctor_Part/Doctors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../Models/Models_For_Patient_Part/Appointment_Model.dart';
import '../../Models/Models_For_Patient_Part/User_Model.dart';

class Patient_And_Appointment_Services {
  Future<List<String>> getAllTimeSlotsForDates(
      context, String doc_category, String docId) async {
    final firestore = FirebaseFirestore.instance;
    List<String> allTimeSlots = [];

    try {
      final docSnapshot =
          await firestore.collection(doc_category).doc(docId).get();
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

  Future<Doctor_Part_Model?> DoctorsDetails(context, String doctorType) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection(doctorType)
          .doc(_auth.currentUser!.uid)
          .get();

      if (documentSnapshot.exists) {
        Map<dynamic, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        Doctor_Part_Model user = Doctor_Part_Model(
            specialization: data['specialization'],
            email: data['email'],
            rating: data['rating'],
            reg_fee: data['reg_fee'],
            sitting_days: data['sitting_days'],
            city: data['city'],
            experience: data['experience'],
            name: data['name'],
            pincode: data['pin_code'],
            address: data['address'],
            profile_pic: data['profile_pic'],
            accountHolderName: data['accountHolderName'],
            accountNumber: data['accountNumber'],
            age: data['age'],
            bankName: data['bankName'],
            bloodGroup: data['bloodGroup'],
            ifscCode: data['ifscCode'],
            mobileNumber: data['mobileNumber'],
            qualification: data['qualification'],
            state: data['state']);

        print(user.name);
        print(user.city);
        print(user.email);

        return user;
      } else {
        // Handle the case where the document with the given mobile number doesn't exist.
        return null;
      }
    } catch (e) {
      print('Error retrieving doctor details: $e');
    }
    return null;
  }

  Future<void> uploadProfilePic(
      context, String doc_category, File file, String userId) async {
    try {
      final folderPath = '$doc_category/$userId/image';

      // List the items in the folder
      final reference = FirebaseStorage.instance.ref(folderPath);
      ListResult listResult = await reference.list();
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
            FirebaseFirestore.instance.collection(doc_category).doc(userId);
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

  Future<void> createOrUpdateFields(context, String doc_category, String userId,
      Map<String, dynamic> updatedData) async {
    try {
      CollectionReference collectionRef =
          FirebaseFirestore.instance.collection(doc_category);
      DocumentReference docRef = collectionRef.doc(userId);

      await docRef.set(updatedData, SetOptions(merge: true));
      print('Updated the data');
    } catch (e) {
      print(e);
    }
  }

  Future<List<Appointment_Model>?> AppointmentDetail(
      context, List<String> appointmentId) async {
    try {
      List<Appointment_Model>? ans = [];
      final firestore = FirebaseFirestore.instance;
      for (int i = 0; i < appointmentId.length; i++) {
        final AppointmentRef =
            firestore.collection("Appointments").doc(appointmentId[i]);
        final AppointmentData = await AppointmentRef.get();

        if (AppointmentData.exists) {
          //Testing
          print(' ${i + 1} Appointment Details');
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
          ans.add(Appointment_Model(
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
        } else {
          // ans.add(null);
          print('AppointmentId  not found.');
        }
      }
      return ans;
    } catch (e) {
      print('Error in Getting Appointment Details: $e');
    }
    return null;
  }

  Future<List<PatientUser>?> UserAllDetails(context, List<String> uid) async {
    try {
      List<PatientUser>? ans = [];
      for (int i = 0; i < uid.length; i++) {
        DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
            .collection("Users")
            .doc(uid[i])
            .get();

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
          print(' ${i + 1} Appointmented User Detaills');
          print(user.appointments);
          print(user.city);
          print(user.email);
          print(user.mobileNo);
          print('${user.firstName} ${user.lastName}');
          print(user.profilePicUrl);

          ans.add(user);
        } else {
          // Handle the case where the document with the given mobile number doesn't exist.
          // ans.add(null);
        }
      }
      return ans;
    } catch (e) {
      print('Error in this: $e');
      return null;
    }
  }
}
