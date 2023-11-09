class Doctor_Part_Model {
  final String name;
  final String pincode;
  final String address;
  final String city;
  final String experience;
  final String rating;
  final String reg_fee;
  final String specialization;
  final String email;
  final List<dynamic> sitting_days;
  final String profile_pic;
  final String mobileNumber;
  final String qualification;
  final String age;
  final String bloodGroup;
  final String state;
  final String bankName;
  final String accountHolderName;
  final String accountNumber;
  final String ifscCode;

  Doctor_Part_Model(
      {required this.profile_pic,
      required this.mobileNumber,
      required this.qualification,
      required this.age,
      required this.bloodGroup,
      required this.state,
      required this.bankName,
      required this.accountHolderName,
      required this.accountNumber,
      required this.ifscCode,
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
