class Appointment_Model {
  final String doctor_name;
  final String doctor_address;
  final String doctor_qualification;
  final String doctorId;
  final String slot;
  final String userId;
  final bool paid;
  final String date_for_booking;
  final bool self;
  final String reg_fee;
  final String mode_of_payment;
  final String name;

  Appointment_Model(
      {required this.name,
      required this.doctor_name,
      required this.doctor_address,
      required this.doctor_qualification,
      required this.date_for_booking,
      required this.mode_of_payment,
      required this.self,
      required this.reg_fee,
      required this.paid,
      required this.doctorId,
      required this.slot,
      required this.userId});
}
