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
  final String? allergies;
  final String? current_medictaion;
  final String? past_medication;
  final String? chronic_diseases;
  final String? injuries;
  final String? smoking_habits;
  final String? alcohol_consumption;
  final String? activity_level;
  final String? food_prefrencce;
  final String? surgeries;

  Map<String, dynamic> appointments;

  PatientUser({
    required this.surgeries,
    required this.allergies,
    required this.current_medictaion,
    required this.past_medication,
    required this.chronic_diseases,
    required this.injuries,
    required this.smoking_habits,
    required this.alcohol_consumption,
    required this.activity_level,
    required this.food_prefrencce,
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
