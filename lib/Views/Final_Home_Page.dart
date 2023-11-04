import 'package:doc_search/Views/Not_Build_Page.dart';
import 'package:doc_search/Views/Patient%20Part/Appointment/PastApointment.dart';
import 'package:doc_search/Views/Patient%20Part/Home/Home_Page.dart';
import 'package:doc_search/Views/Patient%20Part/Profile/Profile_Page.dart';
import 'package:flutter/material.dart';

class Final_Home_Page extends StatefulWidget {
  const Final_Home_Page({super.key});

  @override
  State<Final_Home_Page> createState() => _Final_Home_PageState();
}

class _Final_Home_PageState extends State<Final_Home_Page> {
  int currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
