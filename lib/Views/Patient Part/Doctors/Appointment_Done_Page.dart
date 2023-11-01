import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../Bottom_Bar.dart';

class Appointment_Done_Page extends StatefulWidget {
  const Appointment_Done_Page({super.key});

  @override
  State<Appointment_Done_Page> createState() => _Appointment_Done_PageState();
}

class _Appointment_Done_PageState extends State<Appointment_Done_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Bottombar(),
        body: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios_new,
                          color: Colors.black, size: 26),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Text(
                      'Appointments',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(194, 230, 243, 1.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
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
                                    " August 4,2023",
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
                                    "11:30 AM",
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
                                maxRadius: 50,
                                child: Image.network(
                                    fit: BoxFit.fill,
                                    'https://s3-alpha-sig.figma.com/img/88e8/51db/df6ae21b4d7fa0dee0c33d99d1409301?Expires=1699833600&Signature=NcqPPRUO45~8AMzhmbW5n-OSNaCVPLhz67cz4Mow6k5ZtVmbtxeclnZJc5vn5rsWDtBX6pvKL-OzWixCYONOA9hOKWC4CfD8LxexoIvJZyEKTleZcL~PQT2fLUBlBRToECRgRRyk9xwQQ2dCn8JYJ6lNwOR44xr8x6NaMj4ePf6PqgLWUrU7Sw4coxv347V0HfXM33qVqyLzPWW9~agOreeuR6aMbPScb2q4022PmC~qBQMOvCN0JAjeswboIx07l7RUgjcujJadZo-gh7flFVDmntGc7G6Z~mN4z1m3GuOdDyFfMaHfmmwf~E58ioWdnX6xEuLsRhekL-0IYfpmmQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4'),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Dr. Priya Sharma",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "MBBS, M.ch",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 6.0),
                                      child: Text(
                                        "Specialization",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(0, 176, 91, 1)),
                                      ),
                                    )),
                                Text("Malviya Nagar, New Delhi "),
                                Text("!5 years Experience"),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color.fromRGBO(0, 84, 115, 1)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 6.0),
                                  child: Text(
                                    "Get Directions",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
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
                      style: TextStyle(fontSize: 23),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Your appointment ID XXXXXX',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'We have sent you an SMS with details',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Verified consultation fee of',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      ' ₹450 ',
                      style: TextStyle(
                          fontSize: 20, color: Color.fromRGBO(251, 188, 5, 1)),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
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
                              borderRadius: BorderRadius.circular(15),
                              color: Color.fromRGBO(0, 84, 115, 1)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 6.0),
                            child: Text(
                              "Close",
                              style:
                                  TextStyle(fontSize: 21, color: Colors.white),
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
