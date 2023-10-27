class Doctor {
  final String name;
  final String pincode;
  final String address;
  final String city;
  final String experience;
  final String rating;
  final String reg_fee;
  final List<dynamic> sitting_days;
  final Map<String, dynamic> bookings_for_today;

  Doctor(
      {required this.rating,
      required this.reg_fee,
      required this.sitting_days,
      required this.city,
      required this.experience,
      required this.bookings_for_today,
      required this.name,
      required this.pincode,
      required this.address});
}
