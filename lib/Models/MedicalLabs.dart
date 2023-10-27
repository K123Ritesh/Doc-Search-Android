class MedicalLabs {
  final String name;
  final String pincode;
  final String address;
  final String contactInfo1;
  final String contactInfo2;
  final String detailedAddress;

  MedicalLabs(
      {required this.contactInfo1,
      required this.contactInfo2,
      required this.detailedAddress,
      required this.name,
      required this.pincode,
      required this.address});
}
