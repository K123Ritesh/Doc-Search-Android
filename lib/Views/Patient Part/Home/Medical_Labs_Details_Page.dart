import 'package:doc_search/Bottom_Bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class Medical_Labs_Details_Page extends StatefulWidget {
  const Medical_Labs_Details_Page(
      {super.key,
      required this.name,
      required this.address,
      required this.contactInfo1,
      required this.contactInfo2,
      required this.detailedAddress});

  final String name;
  final String address;
  final String contactInfo1;
  final String contactInfo2;
  final String detailedAddress;

  @override
  State<Medical_Labs_Details_Page> createState() =>
      _Medical_Labs_Details_PageState();
}

class _Medical_Labs_Details_PageState extends State<Medical_Labs_Details_Page> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Bottombar(SelectedIndex: 0),
      body: Container(
          decoration: BoxDecoration(color: Colors.white),
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
                    width: 60.w,
                  ),
                  Text(
                    'Medical Lab',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 23.sp,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                height: 15.h,
              ),
              Center(
                child: Text(
                  'Find a Medical Lab near by',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'assets/Images/MedicalLab.png',
                        height: 150.h,
                        width: 400.w,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Pathology Lab',
                              style: TextStyle(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(15.r)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 14.0.w, vertical: 4.h),
                                  child: Row(
                                    children: [
                                      Image.asset('assets/Icons/star.png',
                                          height: 15.h, width: 15.w),
                                      Text('4.5',
                                          style: TextStyle(color: Colors.white))
                                    ],
                                  ),
                                ))
                          ],
                        )
                      ],
                    ),
                    Text(
                      '${widget.detailedAddress}',
                      style: TextStyle(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () async {
                            final phoneNumber = "${widget.contactInfo1}";
                            final url = "tel:$phoneNumber";

                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              print("Could not launch $url");
                            }
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(15.r)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14.0.w, vertical: 4.h),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text('${widget.contactInfo1}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.sp))
                                  ],
                                ),
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () async {
                            final phoneNumber = "${widget.contactInfo2}";
                            final url = "tel:$phoneNumber";

                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              print("Could not launch $url");
                            }
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(15.r)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14.0.w, vertical: 4.h),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text('${widget.contactInfo2}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.sp))
                                  ],
                                ),
                              )),
                        )
                      ],
                    )
                  ],
                ),
              )
            ]),
          )),
    ));
  }
}
