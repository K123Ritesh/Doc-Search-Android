import 'package:doc_search/Bottom_Bar.dart';
import 'package:doc_search/Models/Doctor.dart';

import 'package:doc_search/Views/Patient%20Part/Doctors/Doctor_Category_Wise_Final.dart';
import 'package:flutter/material.dart';

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

  int selectedOption2 = -1;
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

  DateTime now = DateTime.now();
  List<String> options2 = ['04:00 PM', '05:20 PM', '05:40 PM'];
  List<String> options3 = [
    '06:00 PM',
    '06:20 PM',
    '06:20 PM',
    '04:00 PM',
    '05:20 PM',
    '05:40 PM',
    '05.50 PM'
  ];

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
              child: const CircleAvatar(
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
                height: 26,
                width: 190,
                margin: const EdgeInsets.only(top: 15, left: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A6A83),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                    child: Text(
                  'Clinic Appointment Fee ${widget.doctor.reg_fee}rs',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                )),
              ),
              Container(
                height: 26,
                width: 87,
                margin: const EdgeInsets.only(top: 15, right: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A6A83),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.calendar_month,
                      size: 16,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Center(
                        child: Text(
                      'Calender',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    )),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: const Divider(
              thickness: 1.0,
              color: Colors.grey,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(options.length, (index) {
                  final day = int.parse(options[index]);
                  final dayOfWeek = getDayOfWeek(day);
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedOption = index;
                        // DoctorProvider.knowAvailableSlots(
                        //     context,
                        //     'khn@gmail.com',
                        //     '${selectedOption + 1}/${now.month}/${now.year}',
                        //     options2);
                        // options2 = DoctorProvider.availableSlots == null
                        //     ? options2
                        //     : DoctorProvider.availableSlots!;
                        // DoctorProvider.availableSlots!.clear();
                        // DoctorProvider.knowAvailableSlots(
                        //     context,
                        //     'khn@gmail.com',
                        //     '${selectedOption + 1}/${now.month}/${now.year}',
                        //     options3);
                        // options3 = DoctorProvider.availableSlots == null
                        //     ? options3
                        //     : DoctorProvider.availableSlots!;
                      });
                    },
                    child: Container(
                      width: 76,
                      height: 61,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFF155467),
                        ),
                        color: selectedOption == index
                            ? const Color(0xFF155467)
                            : Colors.white,
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            dayOfWeek,
                            style: TextStyle(
                                color: selectedOption == index
                                    ? Colors.white
                                    : const Color(0xFF155467),
                                fontWeight: FontWeight.w500,
                                fontSize: 10),
                          ),
                          Text(
                            options[index],
                            style: TextStyle(
                                color: selectedOption == index
                                    ? Colors.white
                                    : const Color(0xFF155467),
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: const Divider(
              thickness: 1.0,
              color: Colors.grey,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 25,
              ),
              const Text(
                'Afternoon',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const Text(
                ' (3 Slots)',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0XFF3FA536)),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(options2.length, (index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      toggleSelection(index);
                    });
                  },
                  child: Container(
                    width: 101,
                    height: 36,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color(0xFF155467),
                      ),
                      color: selectedOption2 == index
                          ? const Color(0xFF155467)
                          : Colors.white,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      options2[index],
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
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 25,
                ),
                const Text(
                  'Evening',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const Text(
                  ' (3 Slots)',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0XFF3FA536)),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Wrap(
              spacing: 35,
              runSpacing: 8,
              children: List.generate(options3.length, (index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      toggleSelection2(index);
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
                      options3[index],
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 26,
                  width: 96,
                  // margin: EdgeInsets.only(top: 8),
                  child: ElevatedButton(
                    onPressed: () {
                      if (selectedOption2 == -1 && selectedOption3 == -1) {
                        print('Select the slot first');

                        showToastMessage('Please Select the slot ');
                      } else if (selectedOption2 != -1 &&
                          selectedOption3 != -1) {
                        showToastMessage(
                            'You can select only one slot at a time');
                        print('You can select only one slot at a time');
                      } else if (selectedOption2 != -1) {
                        late String day;
                        if (selectedOption < 9) {
                          day = '0${selectedOption + 1}';
                        } else {
                          day = '${selectedOption + 1}';
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Doctor_Category_Wise_Final(
                                  doctor: widget.doctor,
                                  slot: '${options2[selectedOption2]}',
                                  doc_Category: widget.doc_category,
                                  date: '$day/${now.month}/${now.year}')),
                        );
                      } else if (selectedOption3 != -1) {
                        late String day;
                        if (selectedOption < 9) {
                          day = '0${selectedOption + 1}';
                        } else {
                          day = '${selectedOption + 1}';
                        }
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Doctor_Category_Wise_Final(
                                  doctor: widget.doctor,
                                  doc_Category: widget.doc_category,
                                  slot: '${options2[selectedOption3]}',
                                  date: '$day/${now.month}/${now.year}')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF1A6A83),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Book now'),
                  ),
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        final phoneNumber = "+918809149036";
                        final url = "tel:$phoneNumber";

                        if (await canLaunch(url)) {
                          await launch(url);
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
