import 'package:doc_search/Bottom_Bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Order_Done_Page extends StatefulWidget {
  const Order_Done_Page({super.key});

  @override
  State<Order_Done_Page> createState() => _Order_Done_PageState();
}

class _Order_Done_PageState extends State<Order_Done_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            bottomNavigationBar: Bottombar(SelectedIndex: 0),
            body: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                    padding: EdgeInsets.all(8.0.w),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(children: [
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
                                'Medicine',
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
                            height: 105.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  'Congrats!',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 28.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                'The Prescription was successfully uploaded.Your medicines will be at your doorstep.',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Check status ',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 21.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(Icons.arrow_forward_ios,
                                      color: Colors.blue)
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius:
                                          BorderRadius.circular(15.r)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                      vertical: 6.h,
                                    ),
                                    child: Text('Close',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 21.sp,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ),
                              )
                            ],
                          )
                        ]))))));
  }
}
