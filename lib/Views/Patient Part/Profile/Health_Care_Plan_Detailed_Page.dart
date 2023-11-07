import 'package:doc_search/Payments_Page.dart';
import 'package:doc_search/Views/Not_Build_Page.dart';
import 'package:doc_search/Views/Patient%20Part/Profile/Privacy_Policy_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Bottom_Bar.dart';

class Bronze_Plan_Detailed extends StatefulWidget {
  const Bronze_Plan_Detailed({super.key});

  @override
  State<Bronze_Plan_Detailed> createState() => _Bronze_Plan_DetailedState();
}

class _Bronze_Plan_DetailedState extends State<Bronze_Plan_Detailed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Bottombar(SelectedIndex: 3),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ListView(children: [
          SizedBox(height: 23.h),
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
                'Health Care Plans',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 13.0.w),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: Color.fromRGBO(194, 230, 243, 1)),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                    child: Text(
                      'Doc search Bronze plan',
                      style: TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.all(13.0.h),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  gradient:
                      RadialGradient(center: Alignment.bottomRight, colors: [
                    Color.fromRGBO(15, 96, 125, 1),
                    Color.fromRGBO(73, 144, 157, 1),
                    Color.fromRGBO(39, 119, 147, 1),
                    Color.fromRGBO(66, 134, 158, 1),
                    Color.fromRGBO(10, 163, 185, 0.94)
                  ]),
                  // color: const Color.fromRGBO(41, 120, 147, 1),
                  borderRadius: BorderRadius.circular(15.r)),
              child: Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 20.w,
                                ),
                                Text(
                                  'Bronze Plan (Yearly)',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // SizedBox(
                                //   width: 20,
                                // ),
                                Text(
                                  '(Single Person',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                  ),
                                ),
                                Text(
                                  '*',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20.sp,
                                  ),
                                ),
                                Text(
                                  ' )',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: 40.w,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 20.w,
                                ),
                                Text(
                                  '₹999/Year',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20.w,
                                ),
                                Text(
                                  'Billed Every 1 year ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                  ),
                                ),
                                Text(
                                  '*',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 19.sp,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Check the'),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Privacy_Policy_Page()));
                                  },
                                  child: Text(
                                    ' Privacy Policy',
                                    style: TextStyle(
                                      color: Color.fromRGBO(255, 40, 40, 1),
                                      // fontSize: 19,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        Text(
                          'Benifits',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                        '1. Experience continuous care with unlimited consultations\n2. No shipping charges on order above   Rs 149\n3. 24/7 access to doctors across all specialties\n4. Video consultations for clinic-like experience\n5. Same day delivery on the available medicine (Within 1 Hour)',
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(13.0.w),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  gradient:
                      RadialGradient(center: Alignment.bottomRight, colors: [
                    Color.fromRGBO(15, 96, 125, 1),
                    Color.fromRGBO(73, 144, 157, 1),
                    Color.fromRGBO(39, 119, 147, 1),
                    Color.fromRGBO(66, 134, 158, 1),
                    Color.fromRGBO(10, 163, 185, 0.94)
                  ]),
                  // color: const Color.fromRGBO(41, 120, 147, 1),
                  borderRadius: BorderRadius.circular(15.r)),
              child: Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Buy DocSearch health care Bronze 1 year plan',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17.sp),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Person Details',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RoundedTextField(hintText: 'Name'),
                        RoundedTextField(hintText: 'Mobile Number')
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RoundedTextField(hintText: 'Email Id'),
                        RoundedTextField(hintText: 'Aadhar Number')
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Have a coupon code',
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(251, 188, 5, 1)),
                        ),
                        Text(
                          '₹999/Year',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            'By purchasing this plan you agree with\n Term and Condition of Doc search')
                      ],
                    ),
                    SizedBox(
                      height: 19.h,
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        Payment_Page(amount: 999, type: 'Bronze')));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15.r)),
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.w, vertical: 9.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Continue with Premium',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        )
                      ],
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 50.h,
          )
        ]),
      ),
    );
  }
}

class Gold_Plan_Detailed extends StatefulWidget {
  const Gold_Plan_Detailed({super.key});

  @override
  State<Gold_Plan_Detailed> createState() => _Gold_Plan_DetailedState();
}

class _Gold_Plan_DetailedState extends State<Gold_Plan_Detailed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Bottombar(SelectedIndex: 3),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ListView(children: [
          SizedBox(height: 23.h),
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
                'Health Care Plans',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 13.0.w),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: Color.fromRGBO(194, 230, 243, 1)),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                    child: Text(
                      'Doc search Gold plan',
                      style: TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.all(13.0.h),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  gradient:
                      RadialGradient(center: Alignment.bottomRight, colors: [
                    Color.fromRGBO(15, 96, 125, 1),
                    Color.fromRGBO(73, 144, 157, 1),
                    Color.fromRGBO(39, 119, 147, 1),
                    Color.fromRGBO(66, 134, 158, 1),
                    Color.fromRGBO(10, 163, 185, 0.94)
                  ]),
                  // color: const Color.fromRGBO(41, 120, 147, 1),
                  borderRadius: BorderRadius.circular(15.r)),
              child: Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 20.w,
                                ),
                                Text(
                                  'Gold Plan (Yearly)',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // SizedBox(
                                //   width: 20,
                                // ),
                                Text(
                                  '(Couple + 2 Kids',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                  ),
                                ),
                                Text(
                                  '*',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20.sp,
                                  ),
                                ),
                                Text(
                                  ' )',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: 40.w,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 20.w,
                                ),
                                Text(
                                  '₹2999/Year',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20.w,
                                ),
                                Text(
                                  'Billed Every 1 year ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                  ),
                                ),
                                Text(
                                  '*',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 19.sp,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Check the'),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Privacy_Policy_Page()));
                                  },
                                  child: Text(
                                    ' Privacy Policy',
                                    style: TextStyle(
                                      color: Color.fromRGBO(255, 40, 40, 1),
                                      // fontSize: 19,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        Text(
                          'Benifits',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                        '1. Experience continuous care with unlimited consultations\n2. No shipping charges on order above   Rs 149\n3. 24/7 access to doctors across all specialties\n4. Video consultations for clinic-like experience\n5. Same day delivery on the available medicine (Within 1 Hour)',
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(13.0.w),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  gradient:
                      RadialGradient(center: Alignment.bottomRight, colors: [
                    Color.fromRGBO(15, 96, 125, 1),
                    Color.fromRGBO(73, 144, 157, 1),
                    Color.fromRGBO(39, 119, 147, 1),
                    Color.fromRGBO(66, 134, 158, 1),
                    Color.fromRGBO(10, 163, 185, 0.94)
                  ]),
                  // color: const Color.fromRGBO(41, 120, 147, 1),
                  borderRadius: BorderRadius.circular(15.r)),
              child: Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Buy DocSearch health care Bronze 1 year plan',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17.sp),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Your Details',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RoundedTextField(hintText: 'Name'),
                        RoundedTextField(hintText: 'Mobile Number')
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RoundedTextField(hintText: 'Email Id'),
                        RoundedTextField(hintText: 'Aadhar Number')
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Spouse Details',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RoundedTextField(hintText: 'Name'),
                        RoundedTextField(hintText: 'Aadhar Number')
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedDropdownField(labelText: 'Relation', items: [
                          'Wife',
                          'Husband',
                        ])
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          '1st Child Details',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RoundedTextField(hintText: 'Name'),
                        RoundedTextField(hintText: 'Aadhar Number')
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          '2nd Child Details',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RoundedTextField(hintText: 'Name'),
                        RoundedTextField(hintText: 'Aadhar Number')
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Have a coupon code',
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(251, 188, 5, 1)),
                        ),
                        Text(
                          '₹999/Year',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            'By purchasing this plan you agree with\n Term and Condition of Doc search')
                      ],
                    ),
                    SizedBox(
                      height: 19.h,
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        Payment_Page(amount: 2999, type: 'Gold')));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15.r)),
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.w, vertical: 9.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Continue with Premium',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        )
                      ],
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 50.h,
          )
        ]),
      ),
    );
  }
}

class Silver_Plan_detailed extends StatefulWidget {
  const Silver_Plan_detailed({super.key});

  @override
  State<Silver_Plan_detailed> createState() => _Silver_Plan_detailedState();
}

class _Silver_Plan_detailedState extends State<Silver_Plan_detailed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Bottombar(SelectedIndex: 3),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ListView(children: [
          SizedBox(height: 23.h),
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
                'Health Care Plans',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 13.0.w),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: Color.fromRGBO(194, 230, 243, 1)),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                    child: Text(
                      'Doc search Silver plan',
                      style: TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.all(13.0.h),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  gradient:
                      RadialGradient(center: Alignment.bottomRight, colors: [
                    Color.fromRGBO(15, 96, 125, 1),
                    Color.fromRGBO(73, 144, 157, 1),
                    Color.fromRGBO(39, 119, 147, 1),
                    Color.fromRGBO(66, 134, 158, 1),
                    Color.fromRGBO(10, 163, 185, 0.94)
                  ]),
                  // color: const Color.fromRGBO(41, 120, 147, 1),
                  borderRadius: BorderRadius.circular(15.r)),
              child: Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 20.w,
                                ),
                                Text(
                                  'Silver Plan (Yearly)',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // SizedBox(
                                //   width: 20,
                                // ),
                                Text(
                                  '(Single Person',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                  ),
                                ),
                                Text(
                                  '*',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20.sp,
                                  ),
                                ),
                                Text(
                                  ' )',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: 40.w,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 20.w,
                                ),
                                Text(
                                  '₹1999/Year',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20.w,
                                ),
                                Text(
                                  'Billed Every 1 year ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                  ),
                                ),
                                Text(
                                  '*',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 19.sp,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Check the'),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Privacy_Policy_Page()));
                                  },
                                  child: Text(
                                    ' Privacy Policy',
                                    style: TextStyle(
                                      color: Color.fromRGBO(255, 40, 40, 1),
                                      // fontSize: 19,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        Text(
                          'Benifits',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                        '1. Experience continuous care with unlimited consultations\n2. No shipping charges on order above   Rs 149\n3. 24/7 access to doctors across all specialties\n4. Video consultations for clinic-like experience\n5. Same day delivery on the available medicine (Within 1 Hour)',
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(13.0.w),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  gradient:
                      RadialGradient(center: Alignment.bottomRight, colors: [
                    Color.fromRGBO(15, 96, 125, 1),
                    Color.fromRGBO(73, 144, 157, 1),
                    Color.fromRGBO(39, 119, 147, 1),
                    Color.fromRGBO(66, 134, 158, 1),
                    Color.fromRGBO(10, 163, 185, 0.94)
                  ]),
                  // color: const Color.fromRGBO(41, 120, 147, 1),
                  borderRadius: BorderRadius.circular(15.r)),
              child: Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Buy DocSearch health care Bronze 1 year plan',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17.sp),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Your Details',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RoundedTextField(hintText: 'Name'),
                        RoundedTextField(hintText: 'Mobile Number')
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RoundedTextField(hintText: 'Email Id'),
                        RoundedTextField(hintText: 'Aadhar Number')
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Spouse Details',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RoundedTextField(hintText: 'Name'),
                        RoundedTextField(hintText: 'Aadhar Number')
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedDropdownField(labelText: 'Relation', items: [
                          'Wife',
                          'Husband',
                        ])
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Have a coupon code',
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(251, 188, 5, 1)),
                        ),
                        Text(
                          '₹1999/Year',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            'By purchasing this plan you agree with\n Term and Condition of Doc search')
                      ],
                    ),
                    SizedBox(
                      height: 19.h,
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        Payment_Page(amount: 1999, type: 'Silver')));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15.r)),
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.w, vertical: 9.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Continue with Premium',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        )
                      ],
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 50.h,
          )
        ]),
      ),
    );
  }
}

class Platinum_Plan_Detailed extends StatefulWidget {
  const Platinum_Plan_Detailed({super.key});

  @override
  State<Platinum_Plan_Detailed> createState() => _Platinum_Plan_DetailedState();
}

class _Platinum_Plan_DetailedState extends State<Platinum_Plan_Detailed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Bottombar(SelectedIndex: 3),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ListView(children: [
          SizedBox(height: 23.h),
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
                'Health Care Plans',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 13.0.w),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: Color.fromRGBO(194, 230, 243, 1)),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                    child: Text(
                      'Doc search Platinum plan',
                      style: TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.all(13.0.h),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  gradient:
                      RadialGradient(center: Alignment.bottomRight, colors: [
                    Color.fromRGBO(15, 96, 125, 1),
                    Color.fromRGBO(73, 144, 157, 1),
                    Color.fromRGBO(39, 119, 147, 1),
                    Color.fromRGBO(66, 134, 158, 1),
                    Color.fromRGBO(10, 163, 185, 0.94)
                  ]),
                  // color: const Color.fromRGBO(41, 120, 147, 1),
                  borderRadius: BorderRadius.circular(15.r)),
              child: Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 20.w,
                                ),
                                Text(
                                  'Platinum Plan (Yearly)',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // SizedBox(
                                //   width: 20,
                                // ),
                                Text(
                                  '(Gold Plan + Parents',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                  ),
                                ),
                                Text(
                                  '*',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20.sp,
                                  ),
                                ),
                                Text(
                                  ' )',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: 40.w,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 20.w,
                                ),
                                Text(
                                  '₹3999/Year',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20.w,
                                ),
                                Text(
                                  'Billed Every 1 year ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                  ),
                                ),
                                Text(
                                  '*',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 19.sp,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Check the'),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Privacy_Policy_Page()));
                                  },
                                  child: Text(
                                    ' Privacy Policy',
                                    style: TextStyle(
                                      color: Color.fromRGBO(255, 40, 40, 1),
                                      // fontSize: 19,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        Text(
                          'Benifits',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                        '1. Experience continuous care with unlimited consultations\n2. No shipping charges on order above   Rs 149\n3. 24/7 access to doctors across all specialties\n4. Video consultations for clinic-like experience\n5. Same day delivery on the available medicine (Within 1 Hour)',
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(13.0.w),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  gradient:
                      RadialGradient(center: Alignment.bottomRight, colors: [
                    Color.fromRGBO(15, 96, 125, 1),
                    Color.fromRGBO(73, 144, 157, 1),
                    Color.fromRGBO(39, 119, 147, 1),
                    Color.fromRGBO(66, 134, 158, 1),
                    Color.fromRGBO(10, 163, 185, 0.94)
                  ]),
                  // color: const Color.fromRGBO(41, 120, 147, 1),
                  borderRadius: BorderRadius.circular(15.r)),
              child: Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Buy DocSearch health care Platinum 1 year plan',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17.sp),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Your Details',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RoundedTextField(hintText: 'Name'),
                        RoundedTextField(hintText: 'Mobile Number')
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RoundedTextField(hintText: 'Email Id'),
                        RoundedTextField(hintText: 'Aadhar Number')
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Spouse Details',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RoundedTextField(hintText: 'Name'),
                        RoundedTextField(hintText: 'Aadhar Number')
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedDropdownField(labelText: 'Relation', items: [
                          'Wife',
                          'Husband',
                        ])
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          '1st Child Details',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RoundedTextField(hintText: 'Name'),
                        RoundedTextField(hintText: 'Aadhar Number')
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          '2nd Child Details',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RoundedTextField(hintText: 'Name'),
                        RoundedTextField(hintText: 'Aadhar Number')
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Mother Details',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RoundedTextField(hintText: 'Name'),
                        RoundedTextField(hintText: 'Aadhar Number')
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Father Details',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RoundedTextField(hintText: 'Name'),
                        RoundedTextField(hintText: 'Aadhar Number')
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Have a coupon code',
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(251, 188, 5, 1)),
                        ),
                        Text(
                          '₹3999/Year',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            'By purchasing this plan you agree with\n Term and Condition of Doc search')
                      ],
                    ),
                    SizedBox(
                      height: 19.h,
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        Payment_Page(amount: 3999, type: 'Platinum')));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15.r)),
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.w, vertical: 9.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Continue with Premium',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        )
                      ],
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 50.h,
          )
        ]),
      ),
    );
  }
}

class RoundedTextField extends StatelessWidget {
  final String hintText;

  RoundedTextField({required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.w,
      height: 40.h, // Adjust the width as needed
      padding: EdgeInsets.only(left: 8.0.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class RoundedDropdownField extends StatefulWidget {
  final String labelText;
  final List<String> items;

  RoundedDropdownField({required this.labelText, required this.items});

  @override
  _RoundedDropdownFieldState createState() => _RoundedDropdownFieldState();
}

class _RoundedDropdownFieldState extends State<RoundedDropdownField> {
  String? _selectedItem;
  TextEditingController text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.w,
      height: 40.h, // Adjust the width as needed
      padding: EdgeInsets.only(left: 8.0.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: TextField(
        readOnly: true,
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return ListView(
                children: widget.items.map((item) {
                  return ListTile(
                    title: Text(item),
                    onTap: () {
                      setState(() {
                        _selectedItem = item;
                        text.text = item;
                      });
                      Navigator.pop(context);
                    },
                  );
                }).toList(),
              );
            },
          );
        },
        controller: text,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ListView(
                      children: widget.items.map((item) {
                        return ListTile(
                          title: Text(item),
                          onTap: () {
                            setState(() {
                              _selectedItem = item;
                              text.text = item;
                            });
                            Navigator.pop(context);
                          },
                        );
                      }).toList(),
                    );
                  },
                );
              },
              icon: Icon(Icons.arrow_drop_down)),
          hintText: widget.labelText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
