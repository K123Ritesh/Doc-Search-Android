import 'dart:ffi';

import 'package:doc_search/Appointments_Page.dart';
import 'package:doc_search/Refer_And_Earn_Page.dart';
import 'package:doc_search/Settings_Page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';

class Profile_Page_Doc_Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(color: Color.fromARGB(255, 3, 110, 198)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                SizedBox(height: 23),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.person, size: 90),
                        maxRadius: 50,
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Ritesh Kumar",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "ritkumar@gmail.com | +91 9905411917",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  )
                ]),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          "Appointments",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                        trailing: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Appointments_Page()));
                          },
                          child: Icon(Icons.arrow_forward_ios,
                              size: 20, color: Colors.white),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          "Online Consultations",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios,
                            size: 20, color: Colors.white),
                      ),
                      ListTile(
                        title: Text(
                          "My Test",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios,
                            size: 20, color: Colors.white),
                      ),
                      ListTile(
                        title: Text(
                          "Medical Order",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios,
                            size: 20, color: Colors.white),
                      ),
                      ListTile(
                        title: Text(
                          "Order History",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios,
                            size: 20, color: Colors.white),
                      ),
                      ListTile(
                        title: Text(
                          "Subscriptions",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios,
                            size: 20, color: Colors.white),
                      ),
                      ListTile(
                        title: Text(
                          "Family Tree",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios,
                            size: 20, color: Colors.white),
                      ),
                      ListTile(
                        title: Text(
                          "Refer and Earn",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                        trailing: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Refer_And_Earn_Page()));
                          },
                          child: Icon(Icons.arrow_forward_ios,
                              size: 20, color: Colors.white),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          "Transactions",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios,
                            size: 20, color: Colors.white),
                      ),
                      ListTile(
                        title: Text(
                          "Settings",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                        trailing: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Settings_Page()));
                          },
                          child: Icon(Icons.arrow_forward_ios,
                              size: 20, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      height: 40,
                      width: 230,
                      child: Center(
                        child: Text(
                          'Log Out',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
