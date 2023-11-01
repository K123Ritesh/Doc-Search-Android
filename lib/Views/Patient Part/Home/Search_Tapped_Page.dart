import 'package:doc_search/Config/sizeConfig.dart';
import 'package:doc_search/Views/Patient%20Part/Home/Medical_Labs_Page.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../Bottom_Bar.dart';
import '../Appointment/Appointment.dart';
import '../Doctors/Doctors_Category_Wise.dart';
import 'Medicine_Page.dart';

class Search_Tapped_Page extends StatefulWidget {
  const Search_Tapped_Page({super.key});

  @override
  State<Search_Tapped_Page> createState() => _Search_Tapped_PageState();
}

class _Search_Tapped_PageState extends State<Search_Tapped_Page> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20.fw, right: 20.fw, top: 30.fh),
          child: Column(
            children: [
              SizedBox(
                height: 10.fh,
              ),
              SizedBox(
                height: 20.fh,
              ),
              Container(
                height: 50.fh,
                padding: EdgeInsets.all(8.fh),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF5793A8), width: 1.0),
                    borderRadius: BorderRadius.circular(50)),
                child: TextField(
                  // onTap: () {
                  //   Navigator.of(context).push(MaterialPageRoute(
                  //       builder: (context) => Search_Tapped_Page()));
                  // },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search doctors, hospitals...',
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Appointment1()));
                      },
                      child: Column(
                        children: [
                          Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF5793A8)),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Image.asset(
                                  'assets/DocSearch Android/Group.png')),
                          const SizedBox(
                            height: 12,
                          ),
                          const Text("Doctor"),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Appointment1()));
                          },
                          child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF5793A8)),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Image.asset(
                                  'assets/DocSearch Android/Group 2412.png')),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text("Consultancy"),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Medicine_Page()),
                            );
                          },
                          child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF5793A8)),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Image.asset(
                                  'assets/DocSearch Android/Group-1.png')),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text("Medicines"),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Medical_Labs_Page()),
                            );
                          },
                          child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF5793A8)),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Image.asset(
                                  'assets/DocSearch Android/Group 2420.png')),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text("Lab Test"),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // InkWell(
              //   onTap: () {
              //     Navigator.of(context).push(MaterialPageRoute(
              //         builder: (context) => const Appointment1()));
              //   },
              //   child: Column(
              //     children: [
              //       Container(
              //           width: 40,
              //           height: 40,
              //           decoration: BoxDecoration(
              //             border: Border.all(color: Color(0xFF5793A8)),
              //             borderRadius: BorderRadius.circular(3),
              //           ),
              //           child:
              //               Image.asset('assets/DocSearch Android/Group.png')),
              //       const SizedBox(
              //         height: 12,
              //       ),
              //       const Text("Hospitals"),
              //     ],
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Doctors_Category_Wise(
                                title: 'Dentist',
                                doc_Category: 'Dentist',
                                default_city: 'Kolkata',
                              )));
                    },
                    child: Container(
                        width: 74,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF5793A8)),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Image.asset(
                                'assets/DocSearch Android (1)/image 48.png'),
                            const SizedBox(
                              height: 2,
                            ),
                            const Text(
                              'Dentist',
                              style: TextStyle(fontSize: 11),
                            )
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Doctors_Category_Wise(
                                title: 'Orthopedic',
                                doc_Category: 'Dentist',
                                default_city: 'Kolkata',
                              )));
                    },
                    child: Container(
                        width: 74,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF5793A8)),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Image.asset(
                                'assets/DocSearch Android (1)/Group 2454.png'),
                            const SizedBox(
                              height: 2,
                            ),
                            const Text(
                              'Orthopedic',
                              style: TextStyle(fontSize: 11),
                            )
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Doctors_Category_Wise(
                                title: 'Oncology',
                                doc_Category: 'Dentist',
                                default_city: 'Kolkata',
                              )));
                    },
                    child: Container(
                        width: 74,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF5793A8)),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Image.asset(
                                'assets/DocSearch Android (1)/Group 2447.png'),
                            const SizedBox(
                              height: 2,
                            ),
                            const Text(
                              'Oncology',
                              style: TextStyle(fontSize: 11),
                            )
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Doctors_Category_Wise(
                                title: 'Dermatology',
                                doc_Category: 'Dentist',
                                default_city: 'Kolkata',
                              )));
                    },
                    child: Container(
                        width: 74,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF5793A8)),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Image.asset(
                                'assets/DocSearch Android (1)/Group 2449.png'),
                            const SizedBox(
                              height: 2,
                            ),
                            const Text(
                              'Dermatology',
                              style: TextStyle(fontSize: 11),
                            )
                          ],
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Doctors_Category_Wise(
                                title: 'Cardiology',
                                doc_Category: 'Dentist',
                                default_city: 'Kolkata',
                              )));
                    },
                    child: Container(
                      width: 74,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF5793A8)),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 5),
                          Image.asset(
                              'assets/DocSearch Android (1)/Group 2432.png'),
                          const SizedBox(
                            height: 2,
                          ),
                          const Text(
                            'Cardiology',
                            style: TextStyle(fontSize: 11),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Doctors_Category_Wise(
                                title: 'Gastrology',
                                doc_Category: 'Dentist',
                                default_city: 'Kolkata',
                              )));
                    },
                    child: Container(
                      width: 74,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF5793A8)),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 5),
                          Image.asset(
                              'assets/DocSearch Android (1)/Group 2441.png'),
                          const SizedBox(
                            height: 2,
                          ),
                          const Text(
                            'Gastrology',
                            style: TextStyle(fontSize: 11),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Doctors_Category_Wise(
                                title: 'Neurology',
                                doc_Category: 'Dentist',
                                default_city: 'Kolkata',
                              )));
                    },
                    child: Container(
                      width: 74,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF5793A8)),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 5),
                          Image.asset(
                              'assets/DocSearch Android (1)/image 40.png'),
                          const SizedBox(
                            height: 2,
                          ),
                          const Text(
                            'Neurology',
                            style: TextStyle(fontSize: 11),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Doctors_Category_Wise(
                                title: 'Pediatrics',
                                doc_Category: 'Dentist',
                                default_city: 'Kolkata',
                              )));
                    },
                    child: Container(
                      width: 74,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF5793A8)),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 5),
                          Image.asset(
                              'assets/DocSearch Android (1)/Group 2452.png'),
                          const SizedBox(
                            height: 2,
                          ),
                          const Text(
                            'Pediatrics',
                            style: TextStyle(fontSize: 11),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Bottombar(),
    );
  }
}
