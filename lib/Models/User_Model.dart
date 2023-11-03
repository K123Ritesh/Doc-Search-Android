class PatientUser {
  final String firstName;
  final String lastName;
  final String mobileNo;
  final String city;
  final String email;

  Map<String, dynamic> appointments;

  PatientUser(
      {required this.email,
      required this.firstName,
      required this.lastName,
      required this.mobileNo,
      required this.city,
      required this.appointments});
}
