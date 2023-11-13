import 'package:doc_search/Doctor_bottomBar.dart';
import 'package:doc_search/Providers/Doctor_Part_Provider/Patient_And_Appointment_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Home/Appointment_Patient_Details_Page.dart';

class Doctor_appointments extends StatefulWidget {
  Doctor_appointments({super.key, required this.docCategory});
  final String docCategory;

  @override
  State<Doctor_appointments> createState() => _Doctor_appointmentsState();
}

class _Doctor_appointmentsState extends State<Doctor_appointments> {
  late int selectedButtonIndex;

  @override
  void initState() {
    super.initState();
    selectedButtonIndex = 0; // Set an initial selected button.
  }

  void onButtonTapped(int index) {
    setState(() {
      selectedButtonIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final details = Provider.of<Patient_And_Appointment_Provider>(context);
    return Scaffold(
      bottomNavigationBar:
          DoctorBottombar(SelectedIndex: 1, docCategory: widget.docCategory),
      backgroundColor: const Color(0xFF1B6A85),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B6A85),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
            margin: const EdgeInsets.only(left: 80),
            child: const Text(
              'Appointments',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            )),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 0; i < 3; i++)
                  InkWell(
                    onTap: () {
                      onButtonTapped(i);
                    },
                    child: Container(
                      width: 66,
                      height: 31,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: i == selectedButtonIndex ? 0 : 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color: i == selectedButtonIndex
                            ? Colors.white
                            : Colors.transparent, // Change background color
                      ),
                      child: Center(
                        child: Text(
                          i == 0
                              ? 'All'
                              : i == 1
                                  ? 'Online'
                                  : 'Offline',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: i == selectedButtonIndex
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                Container(
                    width: 73,
                    height: 28,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.calendar_month_outlined,
                              size: 14,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              'Date',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )
                          ],
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 20,
                          color: Colors.white,
                        )
                      ],
                    )),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            // margin: EdgeInsets.all(10),
            height: 63,
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'Time',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0XFF005473)),
                  ),
                ),
                Text(
                  'Name',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0XFF005473)),
                ),
                Text(
                  'Accept/Reject',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0XFF005473)),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Text(
                    'Status',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0XFF005473)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: details.appointmentDetails!.length,
              itemBuilder: (context, index) {
                // final appointment = {
                //   'time': '10:00 AM',
                //   'name': 'John Doe',
                //   'Accept/Reject': 'Reject',
                //   'status': 'Pending',
                // };

                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Appointment_Patient_Details_Page(
                              appointment_model:
                                  details.appointmentDetails![index],
                              user: details.appointmentedUsers![index],
                            )));
                  },
                  child: Container(
                    height: 63,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          details.appointmentDetails![index].slot,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '${details.appointmentDetails![index].name}',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Accept',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            Text(
                              'Confirm',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.delete,
                                size: 20,
                                color: Colors.white,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
