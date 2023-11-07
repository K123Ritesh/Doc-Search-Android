import 'package:doc_search/Models/Doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../Bottom_Bar.dart';
import '../Home/Home_Page.dart';

class Appointment_Done_Page extends StatefulWidget {
  const Appointment_Done_Page(
      {super.key, required this.doctor, required this.Status});

  final Doctor doctor;
  final int Status;

  @override
  State<Appointment_Done_Page> createState() => _Appointment_Done_PageState();
}

class _Appointment_Done_PageState extends State<Appointment_Done_Page> {
  DateTime today = DateTime.now();

  List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 6), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    });
  }

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
              padding: const EdgeInsets.all(8.0),
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
                      'Appointments',
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
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(194, 230, 243, 1.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.calendar_month,
                                    color: Color.fromRGBO(0, 84, 115, 1.0),
                                  ),
                                  Text(
                                    "${months[today.month - 1]} ${today.day} ${today.year}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(0, 84, 115, 1.0),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.lock_clock,
                                    color: Color.fromRGBO(0, 84, 115, 1.0),
                                  ),
                                  Text(
                                    "${today.hour}:${today.minute} ${today.timeZoneName}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(0, 84, 115, 1.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,

                                color: Colors.white, // Background color
                              ),
                              child: CircleAvatar(
                                  backgroundColor:
                                      Color.fromRGBO(194, 230, 243, 1.0),
                                  maxRadius: 50.r,
                                  child: Icon(
                                    Icons.person,
                                    size: 60,
                                  )),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.doctor.name,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "MBBS, M.ch",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 6.h),
                                      child: Text(
                                        widget.doctor.specialization,
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(0, 176, 91, 1)),
                                      ),
                                    )),
                                Text(widget.doctor.address),
                                Text(
                                    "${widget.doctor.experience} years Experience"),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () async {
                                final phoneNumber = "+919905411917";
                                final url = "tel:$phoneNumber";

                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  print("Could not launch $url");
                                }
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.r),
                                      color: Color.fromRGBO(0, 84, 115, 1)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.0.w, vertical: 6.0.h),
                                    child: Text(
                                      "+91 9905411917",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MapWebView(
                                          place: widget.doctor.address)),
                                );
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.r),
                                      color: Color.fromRGBO(0, 84, 115, 1)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.0.w, vertical: 6.0.h),
                                    child: Text(
                                      "Get Directions",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_box,
                      color: Colors.green,
                    ),
                    Text(
                      '  Appointment Confirmed',
                      style: TextStyle(fontSize: 23.sp),
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
                      'Your appointment ID XXXXXX',
                      style: TextStyle(fontSize: 20.sp),
                    )
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'We have sent you an SMS with details',
                      style: TextStyle(fontSize: 20.sp),
                    )
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Verified consultation fee of',
                      style: TextStyle(fontSize: 20.sp),
                    ),
                    Text(
                      widget.doctor.reg_fee,
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: Color.fromRGBO(251, 188, 5, 1)),
                    )
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: Color.fromRGBO(0, 84, 115, 1)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0.w, vertical: 6.0.h),
                            child: Text(
                              "Close",
                              style: TextStyle(
                                  fontSize: 21.sp, color: Colors.white),
                            ),
                          )),
                    ],
                  ),
                ),
              ]),
            )),
      ),
    );
  }
}

class MapWebView extends StatefulWidget {
  final String place;

  MapWebView({required this.place});

  @override
  _MapWebViewState createState() => _MapWebViewState();
}

class _MapWebViewState extends State<MapWebView> {
  @override
  Widget build(BuildContext context) {
    String mapUrl =
        'https://www.google.com/maps/search/?api=1&query=${widget.place}';

    final _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(mapUrl));

    return Scaffold(
        body: SafeArea(child: WebViewWidget(controller: _controller)));
  }
}
