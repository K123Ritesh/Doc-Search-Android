import 'package:doc_search/Views/Doctor%20Part/Profile/Online_Consultations_Page.dart';
import 'package:doc_search/Views/Patient%20Part/Appointment/Appointment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Bottom_Bar.dart';

class Consultancy_Page extends StatefulWidget {
  const Consultancy_Page({super.key});

  @override
  State<Consultancy_Page> createState() => _Consultancy_PageState();
}

class _Consultancy_PageState extends State<Consultancy_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Bottombar(SelectedIndex: 0),
        body: Container(
            decoration: BoxDecoration(
              color: Colors.white,
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
                          color: Colors.black, size: 26),
                    ),
                    SizedBox(
                      width: 70.w,
                    ),
                    Text(
                      'Consultancy',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 23.sp,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Color.fromRGBO(194, 230, 243, 1.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Skip your travel !',
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 84, 115, 1),
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Consult top doctors\neffortlessly',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Starting at ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '₹199',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(0, 84, 115, 1),
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 55.w,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Appointment1()),
                                      );
                                    },
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                  width: 4.w,
                                                  color: Color.fromRGBO(
                                                      0, 84, 115, 1))),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12.0.w,
                                                vertical: 5.h),
                                            child: Text(
                                              'Consult now',
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromRGBO(
                                                      0, 84, 115, 1)),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 47.w,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                width: 167.w,
                                height: 128.h,
                                child: Image.asset('assets/Icons/image 60.png'),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Get 24/7 online consultations with the best doctors',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Expanded(child: Image.asset('assets/Images/Pasted image.png'))
              ]),
            )),
      ),
    );
  }
}
