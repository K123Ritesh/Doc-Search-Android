class Doctor {
  final String name;
  final String pincode;
  final String address;
  final String city;
  final String experience;
  final String rating;
  final String reg_fee;
  final String specialization;
  final String email;
  final String uid;
  final List<dynamic> sitting_days;
  final String profile_pic;

  Doctor(
      {required this.profile_pic,
      required this.uid,
      required this.specialization,
      required this.rating,
      required this.reg_fee,
      required this.sitting_days,
      required this.city,
      required this.experience,
      required this.name,
      required this.email,
      required this.pincode,
      required this.address});
}
