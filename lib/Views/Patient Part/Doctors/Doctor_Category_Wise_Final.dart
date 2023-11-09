import 'package:doc_search/Models/Models_For_Patient_Part/Appointment_Model.dart';
import 'package:doc_search/Providers/User_Part_Provider/Doctor_Provider.dart';
import 'package:doc_search/Providers/User_Part_Provider/User_Provider.dart';
import 'package:doc_search/Views/Patient%20Part/Doctors/Appointment_Done_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../../Bottom_Bar.dart';

import '../../../Models/Models_For_Patient_Part/Doctor.dart';

class Doctor_Category_Wise_Final extends StatefulWidget {
  const Doctor_Category_Wise_Final(
      {super.key,
      required this.slot,
      required this.date,
      required this.doc_Category,
      required this.doctor});

  final String slot;
  final String date;

  final Doctor doctor;

  final String doc_Category;

  @override
  State<Doctor_Category_Wise_Final> createState() =>
      _Doctor_Category_Wise_FinalState();
}

class _Doctor_Category_Wise_FinalState
    extends State<Doctor_Category_Wise_Final> {
  final user = FirebaseAuth.instance.currentUser;
  bool isChecked = false;
  bool isBlue1 = true;
  bool isBlue2 = false;

  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _mobileNumber = TextEditingController();
  final TextEditingController _email = TextEditingController();

  void showToastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final DoctorProvider = Provider.of<Doctor_Provider>(context);
    final userProvider = Provider.of<User_Provider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
            margin: const EdgeInsets.only(left: 80),
            child: const Text(
              'Doctors',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Container(
                child: ListTile(
                  leading: Container(
                    height: 65,
                    width: 65,
                    child: CircleAvatar(
                        // backgroundImage: NetworkImage(''),
                        ),
                  ),
                  title: Text(
                    widget.doctor.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "MBBS,MCh",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          Container(
                            width: 41,
                            height: 16,
                            decoration: BoxDecoration(
                              color: const Color(0xFF1A6A83),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 12,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  widget.doctor.rating,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 95,
                              height: 19,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Color(0xFFE6F7EF),
                              ),
                              child: Center(
                                child: Text(
                                  widget.doctor.specialization,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xFF00B05B),
                                  ),
                                ),
                              ),
                            ),
                            Text(widget.doctor.address,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                            Text('${widget.doctor.experience} years experience',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                          '${widget.doctor.sitting_days[0]},${widget.doctor.sitting_days[1]}',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                      SizedBox(
                        width: 100,
                      ),
                      Text(widget.doctor.reg_fee,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text('10:00 AM - 04:00 PM',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                      SizedBox(
                        width: 50,
                      ),
                      Text('No Booking fee',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ],
                  ),
                  Container(
                    height: 42,
                    width: 272,
                    margin: const EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A6A83),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        Icon(
                          Icons.call,
                          size: 16,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Center(
                            child: Text(
                          '+91 990XXXX917',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )),
                      ],
                    ),
                  ),
                  Container(
                    height: 42,
                    width: 272,
                    margin: const EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A6A83),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 16,
                          color: Colors.white,
                        ),
                        Center(
                            child: Text(
                          widget.doctor.address,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )),
                      ],
                    ),
                  ),
                  Container(
                    height: 42,
                    width: 272,
                    margin: const EdgeInsets.only(top: 15, bottom: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A6A83),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.mail,
                          size: 16,
                          color: Colors.white,
                        ),
                        Center(
                            child: Text(
                          'docsearch@gmail.com',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Patient Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (isBlue1 == false) {
                    isBlue1 = true;
                    isBlue2 = false;
                  }
                });
              },
              child: Container(
                width: 158,
                height: 38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xFFF1FDFF),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: Container(
                        width: 16,
                        height: 18,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isBlue1
                              ? const Color(0xFF1A6A83)
                              : Colors.transparent,
                          border: Border.all(
                            color: const Color(0xFF1A6A83),
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      '${userProvider.user.firstName} ${userProvider.user.lastName}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF1A6A83),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (isBlue2 == false) {
                    isBlue2 = true;
                    isBlue1 = false;
                  }
                });
              },
              child: Container(
                width: 158,
                height: 38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xFFF1FDFF),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: Container(
                        width: 16,
                        height: 18,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isBlue2
                              ? const Color(0xFF1A6A83)
                              : Colors.transparent,
                          border: Border.all(
                            color: const Color(0xFF1A6A83),
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Someone else',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF1A6A83),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            isBlue2 == true
                ? Column(
                    children: [
                      Text(
                        'Please provide following information ',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: TextFormField(
                            controller: _fullName,
                            decoration: InputDecoration(
                              labelText: 'Full Name',
                              // border: OutlineInputBorder(),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: TextFormField(
                            controller: _mobileNumber,
                            decoration: InputDecoration(
                              labelText: 'Mobile Number',
                              // border: OutlineInputBorder(),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: TextFormField(
                            controller: _email,
                            decoration: InputDecoration(
                              labelText: 'Email Address',
                              // border: OutlineInputBorder(),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Text(''),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                  ),
                  Image.network(
                    'https://s3-alpha-sig.figma.com/img/fc39/822d/4f0d87c00046b984c9fbfc08eb3be9b6?Expires=1699228800&Signature=a5hFvuDmOq52eWJALNBvy5cOT1rvYru3UZOHBUN0eigKKHIn4vIzuQz2RNwFu0YP~~nbAZq4DCQ0~Py3YEZYvwVPbltMiNTyakxFAiljinBika5UT3cId~U8iOLuqmgVJvY9fUWfRnOoL50cFVg53HodXAJPE6qBnOh3v4v-Jp9n5sfIL-exD~UGmBdeyAlm5MCZ~uoPD9J79zwqsmiF5Tr33JQvQ4sH7J3B7vtKOXcfuq1tyI5avCs2V9n0FxD3cTWFKxVa-AvmNp6dLIYhJyjhpBN6kKdDkoYsfZcAWQlsN~gR3AAqV0cDYlGdXxUgyW0OGtGO5FmZEiM~1naJ4w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                    height: 24,
                    width: 24,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'You can get updates on whatsapp\nnumber on 9876543210',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),
            Container(
              height: 36,
              width: 155,
              // margin: EdgeInsets.only(top: 8),
              child: ElevatedButton(
                onPressed: () {
                  if (isBlue2 == true) {
                    if (_mobileNumber.text.length != 10 ||
                        _email.text == "" ||
                        _fullName.text == "") {
                      showToastMessage('Please Enter The patient Details');
                    } else if (isChecked == false) {
                      showToastMessage('Please Accept T & C');
                    } else {
                      print(widget.doctor.uid);
                      DoctorProvider.bookAppointment(
                        context,
                        Appointment_Model(
                            name: _fullName.text,
                            doctor_address: widget.doctor.address,
                            doctor_name: widget.doctor.name,
                            doctor_qualification: 'MBBS , MS',
                            date_for_booking: widget.date,
                            mode_of_payment: 'online',
                            self: false,
                            reg_fee: widget.doctor.reg_fee,
                            paid: true,
                            doctorId: widget.doctor.uid,
                            slot: widget.slot,
                            userId: user!.uid),
                        widget.doc_Category,
                      );

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Appointment_Done_Page(
                                  doctor: widget.doctor,
                                  Status: DoctorProvider.status,
                                )),
                      );
                    }
                  } else {
                    if (isChecked == false) {
                      showToastMessage('Please Accept T & C');
                    } else {
                      print(widget.doctor.uid);
                      DoctorProvider.bookAppointment(
                        context,
                        Appointment_Model(
                            name:
                                '${userProvider.user.firstName} ${userProvider.user.lastName}',
                            doctor_address: widget.doctor.address,
                            doctor_name: widget.doctor.name,
                            doctor_qualification: 'MBBS , MS',
                            date_for_booking: widget.date,
                            mode_of_payment: 'online',
                            self: true,
                            reg_fee: widget.doctor.reg_fee,
                            paid: true,
                            doctorId: widget.doctor.uid,
                            slot: widget.slot,
                            userId: user!.uid),
                        widget.doc_Category,
                      );

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Appointment_Done_Page(
                                  doctor: widget.doctor,
                                  Status: DoctorProvider.status,
                                )),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF1A6A83),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Confirm Clinic Visit',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
      bottomNavigationBar: Bottombar(SelectedIndex: 0),
    );
  }
}
