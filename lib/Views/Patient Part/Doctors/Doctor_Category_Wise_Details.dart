import 'package:doc_search/Bottom_Bar.dart';
import 'package:doc_search/Models/Models_For_Patient_Part/Doctor.dart';

import 'package:doc_search/Views/Patient%20Part/Doctors/Doctor_Category_Wise_Final.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:intl/intl.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class Doctors_Category_WiseDetails extends StatefulWidget {
  const Doctors_Category_WiseDetails(
      {super.key, required this.doctor, required this.doc_category});

  final Doctor doctor;
  final String doc_category;

  @override
  State<Doctors_Category_WiseDetails> createState() =>
      _Doctors_Category_WiseDetailsState();
}

class _Doctors_Category_WiseDetailsState
    extends State<Doctors_Category_WiseDetails> {
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

  int selectedOption2 = 0;
  void toggleSelection(int index) {
    setState(() {
      if (selectedOption2 == index) {
        selectedOption2 = -1;
      } else {
        selectedOption2 = index;
      }
    });
  }

  int selectedOption3 = -1;
  void toggleSelection2(int index) {
    setState(() {
      if (selectedOption3 == index) {
        selectedOption3 = -1;
      } else {
        selectedOption3 = index;
      }
    });
  }

  int selectedOption = 0;
  List<String> options = List.generate(31, (index) => (index + 1).toString());

  String getDayOfWeek(int day) {
    final now = DateTime.now();
    final date = DateTime(now.year, now.month, day);
    final dayFormat = DateFormat('E');
    return dayFormat.format(date);
  }

  DateTime selectedDate = DateTime.now();
  List<String> filterSlots(List<String> slots) {
    DateTime currentTime = DateTime.now().add(Duration(hours: 9));
    print('Current Time: $currentTime');

    return slots.where((slot) {
      String slotTime = slot.split(' ')[0];
      String slotPeriod = slot.split(' ')[1];
      String formattedSlotTime = slotTime + ' ' + slotPeriod.toUpperCase();

      DateFormat format = DateFormat('h:mm a');
      DateTime slotDateTime = format.parse(formattedSlotTime);
      DateTime currentDateTime = format.parse(format.format(currentTime));

      // Compare slotDateTime with current time
      return slotDateTime.isAfter(currentDateTime);
    }).toList();
  }

  DateTime now = DateTime.now();
  List<String> morningSlots = [
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
    '11:30 AM',
    '12:00 PM',
    '12:30 PM',
    '01:00 PM',
    '01:30 PM',
    '02:00 PM'
  ];
  List<String> eveningSlots = [
    '03:00 PM',
    '03:30 PM',
    '04:00 PM',
    '04:30 PM',
    '05:00 PM',
    '05:30 PM',
    '06:00 PM',
    '06:30 PM',
    '07:00 PM',
  ];

  List<String> morningSlot1 = [];
  List<String> eveningSlot1 = [];
  String dateSelected = '';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(), // Disable past dates
      lastDate: DateTime.now().add(
          Duration(days: 30)), // Set a reasonable upper limit for the future
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateSelected =
            '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
      });
    } else {
      setState(() {
        dateSelected =
            '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
      });
    }

    if (dateSelected ==
        '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}') {
      setState(() {
        morningSlots = filterSlots(morningSlots);
      });
    } else {
      setState(() {
        morningSlots = morningSlot1;
      });
    }

    if (dateSelected ==
        '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}') {
      setState(() {
        eveningSlots = filterSlots(eveningSlots);
      });
    } else {
      setState(() {
        eveningSlots = eveningSlot1;
      });
    }
  }

  @override
  void initState() {
    eveningSlot1 = eveningSlots;
    morningSlot1 = morningSlots;
    dateSelected =
        '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';
    if (dateSelected ==
        '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}') {
      setState(() {
        morningSlots = filterSlots(morningSlots);
      });
    }
    if (dateSelected ==
        '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}') {
      setState(() {
        eveningSlots = filterSlots(eveningSlots);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Bottombar(SelectedIndex: 0),
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
      body: ListView(
        children: [
          ListTile(
            leading: Container(
              height: 65,
              width: 65,
              child: CircleAvatar(
                // backgroundImage: NetworkImage(''),
                child: widget.doctor.profile_pic == ' '
                    ? Icon(Icons.person)
                    : ClipOval(
                        child: Image.network(
                          widget.doctor.profile_pic,
                          width: 60.0.w,
                          height: 60.0.h,
                          fit: BoxFit.cover,
                        ),
                      ),
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
                    const Text(
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
                  margin: const EdgeInsets.only(top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 95,
                        height: 19,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: const Color(0xFFE6F7EF),
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
                Container(
                  height: 26,
                  width: 178,
                  margin: const EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A6A83),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.verified,
                        size: 16,
                        color: Colors.white,
                      ),
                      Center(
                          child: Text(
                        'Trusted Healthcare',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, top: 10),
            child: const Row(
              children: [
                Icon(
                  Icons.verified,
                  size: 16,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 5,
                ),
                Center(
                    child: Text(
                  'Medical Registration Verified',
                  style: TextStyle(fontSize: 14),
                )),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // height: 26,
                // width: 190,
                margin: const EdgeInsets.only(top: 15, left: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A6A83),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  child: Text(
                    'Appointment Fee - ${widget.doctor.reg_fee}₹ ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                )),
              ),
              InkWell(
                child: Container(
                    // height: 26,
                    // width: 87,
                    margin: const EdgeInsets.only(top: 15, right: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A6A83),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      child: Text(
                        'View Doctor Profile',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: const Divider(
              thickness: 1.0,
              color: Colors.grey,
            ),
          ),
          // SizedBox(
          //   height: 20,
          // ),
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Container(
          //     margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: List.generate(options.length, (index) {
          //         final day = int.parse(options[index]);
          //         final dayOfWeek = getDayOfWeek(day);
          //         return InkWell(
          //           onTap: () {
          //             setState(() {
          //               selectedOption = index;
          //               // DoctorProvider.knowAvailableSlots(
          //               //     context,
          //               //     'khn@gmail.com',
          //               //     '${selectedOption + 1}/${now.month}/${now.year}',
          //               //     morningSlots);
          //               // morningSlots = DoctorProvider.availableSlots == null
          //               //     ? morningSlots
          //               //     : DoctorProvider.availableSlots!;
          //               // DoctorProvider.availableSlots!.clear();
          //               // DoctorProvider.knowAvailableSlots(
          //               //     context,
          //               //     'khn@gmail.com',
          //               //     '${selectedOption + 1}/${now.month}/${now.year}',
          //               //     eveningSlots);
          //               // eveningSlots = DoctorProvider.availableSlots == null
          //               //     ? eveningSlots
          //               //     : DoctorProvider.availableSlots!;
          //             });
          //           },
          //           child: Container(
          //             width: 76,
          //             height: 61,
          //             margin: const EdgeInsets.only(right: 10),
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(12),
          //               border: Border.all(
          //                 color: const Color(0xFF155467),
          //               ),
          //               color: selectedOption == index
          //                   ? const Color(0xFF155467)
          //                   : Colors.white,
          //             ),
          //             alignment: Alignment.center,
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Text(
          //                   dayOfWeek,
          //                   style: TextStyle(
          //                       color: selectedOption == index
          //                           ? Colors.white
          //                           : const Color(0xFF155467),
          //                       fontWeight: FontWeight.w500,
          //                       fontSize: 10),
          //                 ),
          //                 Text(
          //                   options[index],
          //                   style: TextStyle(
          //                       color: selectedOption == index
          //                           ? Colors.white
          //                           : const Color(0xFF155467),
          //                       fontWeight: FontWeight.w500,
          //                       fontSize: 20),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         );
          //       }),
          //     ),
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w),
            child: InkWell(
              onTap: () {
                _selectDate(context);
              },
              child: Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFF1A6A83),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Select Date',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
            ),
          ),

          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Container(
              child: Row(
                children: [
                  Text(
                    'Available Slots for ',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    dateSelected ==
                            '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}'
                        ? 'Today'
                        : ' $dateSelected',
                    style: TextStyle(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.red),
                  )
                ],
              ),
            ),
          ),
          Container(
            // margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: const Divider(
              thickness: 0.3,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 25,
              ),
              const Text(
                'Morning',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                ' (${morningSlots.length} Slots)',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Color(0XFF3FA536)),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Wrap(
              spacing: 20.w,
              runSpacing: 8.h,
              children: List.generate(morningSlots.length, (index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      toggleSelection(index);
                      selectedOption3 = -1;
                    });
                  },
                  child: Container(
                    width:
                        100, // Adjust the width to fit three items in one row
                    height: 36,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xFF155467)),
                      color: selectedOption2 == index
                          ? const Color(0xFF155467)
                          : Colors.white,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      morningSlots[index],
                      style: TextStyle(
                          color: selectedOption2 == index
                              ? Colors.white
                              : const Color(0xFF155467),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                );
              }),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 25,
                ),
                const Text(
                  'Evening',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  ' (${eveningSlots.length} Slots)',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Color(0XFF3FA536)),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Wrap(
              spacing: 20.w,
              runSpacing: 8.h,
              children: List.generate(eveningSlots.length, (index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      toggleSelection2(index);
                      selectedOption2 = -1;
                    });
                  },
                  child: Container(
                    width:
                        100, // Adjust the width to fit three items in one row
                    height: 36,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xFF155467)),
                      color: selectedOption3 == index
                          ? const Color(0xFF155467)
                          : Colors.white,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      eveningSlots[index],
                      style: TextStyle(
                          color: selectedOption3 == index
                              ? Colors.white
                              : const Color(0xFF155467),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                );
              }),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  // height: 26,
                  // width: 96,
                  // margin: EdgeInsets.only(top: 8),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 5.h),
                    child: ElevatedButton(
                      onPressed: () {
                        if (selectedOption2 == -1 && selectedOption3 == -1) {
                          print('Select the Slot first');

                          showToastMessage('Please Select the Slot ');
                        } else if (selectedOption2 != -1 ||
                            selectedOption3 != -1) {
                          String Slot = selectedOption2 != -1
                              ? '${morningSlots[selectedOption2]}'
                              : '${eveningSlots[selectedOption3]}';
                          print(Slot);
                          print(dateSelected);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Doctor_Category_Wise_Final(
                                    doctor: widget.doctor,
                                    slot: selectedOption2 != -1
                                        ? '${morningSlots[selectedOption2]}'
                                        : '${eveningSlots[selectedOption3]}',
                                    doc_Category: widget.doc_category,
                                    date: dateSelected)),
                          );
                        } else {
                          showToastMessage('Something went Wrong');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1A6A83),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Book now',
                            style: TextStyle(fontSize: 18.sp),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        final phoneNumber = "+918809149036";
                        final url = "tel:$phoneNumber";

                        if (await canLaunchUrl(Uri.parse(url))) {
                          await launchUrl(Uri.parse(url));
                        } else {
                          print("Could not launch $url");
                        }
                      },
                      child: Container(
                        height: 26,
                        width: 182,
                        margin: const EdgeInsets.only(top: 15),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A6A83),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Row(
                          // mainAxisAlignment: MainAxisAlignment.,
                          children: [
                            SizedBox(
                              width: 12,
                            ),
                            Icon(
                              Icons.call,
                              size: 12,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Center(
                                child: Text(
                              '+91 8809149036',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 26,
                      width: 182,
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
                            size: 12,
                            color: Colors.white,
                          ),
                          Center(
                              child: Text(
                            widget.doctor.address,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          )),
                        ],
                      ),
                    ),
                    Container(
                      height: 26,
                      width: 182,
                      margin: const EdgeInsets.only(top: 15),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A6A83),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.mail,
                            size: 12,
                            color: Colors.white,
                          ),
                          Center(
                              child: Text(
                            'docsearch@gmail.com',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          )),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
