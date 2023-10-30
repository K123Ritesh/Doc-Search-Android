import 'package:doc_search/Views/Home/Medical_Labs_Page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../Bottom_Bar.dart';
import '../../Testing_page.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF5793A8), width: 1.0),
                    borderRadius: BorderRadius.circular(50)),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none, // Remove the default border
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search doctors, hospitals...',
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Text(
                    "QUICK LINKS",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Testing_Widget()));
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFF5793A8)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/DocSearch Android/Group.png',
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "Doctor",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                )
                              ],
                            ),
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Testing_Widget()));
                      },
                      child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFF5793A8)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/DocSearch Android/Group 2412.png',
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "Consultancy",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                )
                              ],
                            ),
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Testing_Widget()));
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFF5793A8)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/DocSearch Android/Group.png',
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "Doctor",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                )
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Testing_Widget()));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF5793A8)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/DocSearch Android/Group.png',
                                height: 40,
                                width: 40,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                "Doctor",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )
                            ],
                          ),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Testing_Widget()));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF5793A8)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/DocSearch Android/Group.png',
                                height: 40,
                                width: 40,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                "Doctor",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )
                            ],
                          ),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Testing_Widget()));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF5793A8)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/DocSearch Android/Group.png',
                                height: 40,
                                width: 40,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                "Doctor",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )
                            ],
                          ),
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Bottombar(),
    );
  }
}
