import 'package:doc_search/Bottom_Bar.dart';
import 'package:flutter/material.dart';

class Online_Consultations_Page extends StatefulWidget {
  const Online_Consultations_Page({super.key});

  @override
  State<Online_Consultations_Page> createState() =>
      _Online_Consultations_PageState();
}

class _Online_Consultations_PageState extends State<Online_Consultations_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Bottombar(
          SelectedIndex: 3,
        ),
        body: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF155467),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
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
                          color: Colors.white, size: 26),
                    ),
                    SizedBox(
                      width: 79,
                    ),
                    Text(
                      'Online Consultations',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Image.asset(
                  "assets/Icons/Video call-bro 1.png",
                  height: 298,
                  width: 298,
                ),
                Text(
                  "SORRY !",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "Work in Progress",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                ),
              ]),
            )),
      ),
    );
  }
}
