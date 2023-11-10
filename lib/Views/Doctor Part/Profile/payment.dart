import 'package:doc_search/Providers/Doctor_Part_Provider/Patient_And_Appointment_Provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../Home/Appointment_Patient_Details_Page.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  late int selectedButtonIndex;

  @override
  void initState() {
    super.initState();
    selectedButtonIndex = 0;
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
              'Payment',
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
                      width: 75,
                      height: 29,
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
                                  ? 'Complete'
                                  : 'Pending',
                          style: TextStyle(
                            fontSize: 14,
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
                    'Name',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0XFF005473)),
                  ),
                ),
                Text(
                  'Amount',
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
                // Replace with your appointment data

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
                      children: [
                        Text(
                          details.appointmentDetails![index].name,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          details.myDetails!.reg_fee,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Text(
                          details.appointmentDetails![index].paid == true
                              ? 'Yes'
                              : 'No',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Row(
                          children: [
                            Text(
                              'Confirmed',
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
