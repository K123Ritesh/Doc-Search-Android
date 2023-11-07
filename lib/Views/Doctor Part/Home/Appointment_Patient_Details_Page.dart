import 'package:doc_search/Views/Doctor%20Part/Home/Appointment_Prescription.dart';
import 'package:doc_search/Views/Doctor%20Part/Home/Home_Page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Bottom_Bar.dart';

class Appointment_Patient_Details_Page extends StatefulWidget {
  const Appointment_Patient_Details_Page({super.key});

  @override
  State<Appointment_Patient_Details_Page> createState() =>
      _Appointment_Patient_Details_PageState();
}

class _Appointment_Patient_Details_PageState
    extends State<Appointment_Patient_Details_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Bottombar(
        SelectedIndex: 0,
      ),
      body: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1B6A85),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0.w),
            child: ListView(children: [
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15.w,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios_new,
                        color: Colors.white, size: 26),
                  ),
                  SizedBox(
                    width: 60.w,
                  ),
                  Text(
                    'Appointments',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23.sp,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              AppointmentId_Searched(),
              Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Container(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(28.0.w),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Allergies',
                                style: TextStyle(fontSize: 20.sp),
                              ),
                              Text(
                                'No',
                                style: TextStyle(fontSize: 20.sp),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Current medications',
                                style: TextStyle(fontSize: 20.sp),
                              ),
                              Text(
                                'No',
                                style: TextStyle(fontSize: 20.sp),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Past medications',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                'No',
                                style: TextStyle(fontSize: 20.sp),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Chronic diseases',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                'Diabties',
                                style: TextStyle(fontSize: 20.sp),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Injuries',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                'No',
                                style: TextStyle(fontSize: 20.sp),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Surgeries',
                                style: TextStyle(fontSize: 20.sp),
                              ),
                              Text(
                                'No',
                                style: TextStyle(fontSize: 20.sp),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  // height: 250,
                  width: 300.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r)),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Container(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(28.0.w),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Smoking Habits',
                                style: TextStyle(fontSize: 20.sp),
                              ),
                              Text(
                                'Yes',
                                style: TextStyle(fontSize: 20.sp),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Alcohol Consumptions',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                'No',
                                style: TextStyle(fontSize: 20.sp),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Activity Level',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                'Moderate',
                                style: TextStyle(fontSize: 20.sp),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Food Prefrence',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                'Non-veg',
                                style: TextStyle(fontSize: 20.sp),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Occupation',
                                style: TextStyle(fontSize: 20.sp),
                              ),
                              Text(
                                'Farmer',
                                style: TextStyle(fontSize: 20.sp),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  // height: 250,
                  width: 300.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r)),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Appointment_Prescription()));
                },
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10.r)),
                        height: 28.h,
                        width: 77.w,
                        child: Center(
                          child: Text(
                            'Proceed',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.h,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ]),
          )),
    ));
  }
}
