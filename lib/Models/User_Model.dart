import 'package:doc_search/Providers/User_Part_Provider/User_Provider.dart';

class PatientUser {
  final String firstName;
  final String lastName;
  final String mobileNo;
  final String city;
  final String email;
  final String profilePicUrl;
  final String profession;
  final String age;
  final String gender;
  final String bloodGrp;
  final String address;
  final String landmark;
  final String pincode;

  Map<String, dynamic> appointments;

  PatientUser({
    required this.profilePicUrl,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.mobileNo,
    required this.city,
    required this.appointments,
    required this.profession,
    required this.age,
    required this.gender,
    required this.bloodGrp,
    required this.address,
    required this.landmark,
    required this.pincode,
  });
}
