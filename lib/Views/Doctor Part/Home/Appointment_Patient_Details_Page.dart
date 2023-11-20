import 'package:doc_search/Models/Models_For_Patient_Part/Appointment_Model.dart';
import 'package:doc_search/Models/Models_For_Patient_Part/User_Model.dart';
import 'package:doc_search/Providers/Doctor_Part_Provider/Patient_And_Appointment_Provider.dart';
import 'package:doc_search/Views/Doctor%20Part/Home/Appointment_Prescription.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../Bottom_Bar.dart';

class Appointment_Patient_Details_Page extends StatefulWidget {
  Appointment_Patient_Details_Page(
      {super.key,
      required this.appointmentId,
      required this.appointment_model,
      required this.user});
  final Appointment_Model appointment_model;
  final PatientUser user;
  final String appointmentId;

  @override
  State<Appointment_Patient_Details_Page> createState() =>
      _Appointment_Patient_Details_PageState();
}

class _Appointment_Patient_Details_PageState
    extends State<Appointment_Patient_Details_Page> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Patient_And_Appointment_Provider>(context);
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: Container(
                    // width: 100,
                    decoration: BoxDecoration(
                        color: const Color(0xFF1B6A85),
                        borderRadius: BorderRadius.circular(15.r)),
                    child: Row(
                      children: [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.all(14.0.w),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              maxRadius: 50.r,
                              child: widget.user.profilePicUrl == " "
                                  ? Icon(
                                      Icons.person,
                                      color: Colors.red,
                                      size: 70,
                                    )
                                  : ClipOval(
                                      child: Image.network(
                                        widget.user.profilePicUrl,
                                        width: 90.0.w,
                                        height: 90.0.h,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.all(8.0.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Id Number - ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '583694',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Name - ',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        '${widget.user.firstName}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Age - ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${widget.user.age}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Address - ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      widget.user.city,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
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
                                'Allergies',
                                style: TextStyle(fontSize: 20.sp),
                              ),
                              Text(
                                widget.user.allergies ?? 'No',
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
                                widget.user.current_medictaion ?? 'N/A',
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
                                widget.user.past_medication ?? 'N/A',
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
                                widget.user.chronic_diseases ?? 'N/A',
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
                                widget.user.injuries ?? 'N/A',
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
                                widget.user.surgeries ?? 'N/A',
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
                                widget.user.smoking_habits ?? 'N/A',
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
                                widget.user.alcohol_consumption ?? 'N/A',
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
                                widget.user.activity_level ?? 'N/A',
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
                                widget.user.food_prefrencce ?? 'N/A',
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
                                widget.user.profession,
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
                  provider.getMedicineLists(context, widget.appointmentId);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Appointment_Prescription(
                            appointmentId: widget.appointmentId,
                            user: widget.user,
                          )));
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
