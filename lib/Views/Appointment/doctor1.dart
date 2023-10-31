import 'package:doc_search/Bottom_Bar.dart';
import 'package:doc_search/Config/sizeConfig.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Providers/Doctor_Provider.dart';
import 'Appointment.dart';
import 'doctor2.dart';

class Doctors extends StatefulWidget {
  const Doctors({super.key, required this.doc_Category});

  final String doc_Category;

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      bottomNavigationBar: Bottombar(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Appointment1()),
            );
            // Navigator.pop(context);
          },
        ),
        title: Container(
          margin: const EdgeInsets.only(left: 80),
          child: Text(
            "Doctor",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        // itemCount: DoctorProvider.acc_to_search!.length,
        itemBuilder: (context, index) {
          // final doctor = doctors[index];
          return Container(
            height: 230.fh,
            margin: EdgeInsets.all(20.fw),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        // You can add the image here
                        // backgroundImage: NetworkImage('URL'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Dr. Priya Sharma",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "MBBS,MCh",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: 140.fw,
                            ),
                            Container(
                              width: 41,
                              height: 16,
                              decoration: BoxDecoration(
                                color: const Color(0xFF1A6A83),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '4.7',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 95,
                          height: 19,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Color(0xFFE6F7EF),
                          ),
                          child: Center(
                            child: Text(
                              "Surgical Onotology",
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xFF00B05B),
                              ),
                            ),
                          ),
                        ),
                        Text('Malviya Nagar, New Delhi',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black)),
                        Text('15 years experience',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black)),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    // margin: EdgeInsets.only(top: 62),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 20.fw,
                            ),
                            Text('Tues & Thu',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                            SizedBox(
                              width: 100.fw,
                            ),
                            Text('₹450',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                          ],
                        ),
                        SizedBox(
                          height: 5.fh,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 20.fw,
                            ),
                            Text('10:00 AM - 04:00 PM',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                            SizedBox(
                              width: 40.fw,
                            ),
                            Text('No Booking fee',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                          ],
                        ),
                        SizedBox(
                          height: 5.fh,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DoctorsDetails()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF1A6A83),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Container(
                            height: 42.fh,
                            width: 280.fw,
                            child: Center(
                              child: Text(
                                'Book an appointment',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15.fh),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.fh,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
