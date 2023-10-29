class Doctor {
  final String name;
  final String pincode;
  final String address;
  final String city;
  final String experience;
  final String rating;
  final String reg_fee;
  final List<dynamic> sitting_days;

  Doctor(
      {required this.rating,
      required this.reg_fee,
      required this.sitting_days,
      required this.city,
      required this.experience,
      required this.name,
      required this.pincode,
      required this.address});
}
