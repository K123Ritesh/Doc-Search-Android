import 'package:doc_search/Views/Doctor%20Part/Profile/Online_Consultations_Page.dart';
import 'package:doc_search/Views/Doctor%20Part/Profile/Settings_Page.dart';
import 'package:doc_search/Views/Patient%20Part/Profile/Refer_And_Earn_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../Doctor_bottomBar.dart';

class Doctor_Profile_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: const Color(0xFF155467),
    ));
    return Scaffold(
      bottomNavigationBar: DoctorBottombar(SelectedIndex: 3),
      body: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF155467),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Row(
                  children: [
                    SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios_new,
                          color: Colors.white, size: 26),
                    ),
                  ],
                ),
                SizedBox(height: 23),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          //   Navigator.of(context).push(MaterialPageRoute(
                          //       builder: (context) => EditUserProfile()));
                          },
                          child: Stack(
                        children: <Widget>[
                          CircleAvatar(
                            child: Icon(Icons.person, size: 90),
                            maxRadius: 50,
                            backgroundColor: Colors.white,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Dr. Ritesh Kumar",
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
                      InkWell(
                        // onTap: () {
                        //   Navigator.of(context).push(MaterialPageRoute(
                        //       builder: (context) => Appointments_Page()));
                        // },
                        child: ListTile(
                          title: Text(
                            "Appointments",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                          trailing: InkWell(
                            // onTap: () {
                            //   Navigator.of(context).push(MaterialPageRoute(
                            //       builder: (context) => Appointments_Page()));
                            // },
                            child: Icon(Icons.arrow_forward_ios,
                                size: 20, color: Colors.white),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  Online_Consultations_Page()));
                        },
                        child: ListTile(
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
                      ),
                      ListTile(
                        title: Text(
                          "Set Time & Day",
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
                          "Payments",
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
                          "Community",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios,
                            size: 20, color: Colors.white),
                      ),
                      InkWell(
                        child: ListTile(
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
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Refer_And_Earn_Page()));
                        },
                        child: ListTile(
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
                      ),
                      InkWell(
                        // onTap: () {
                        //   Navigator.of(context).push(MaterialPageRoute(
                        //       builder: (context) => Settings_Page()));
                        // },
                        child: ListTile(
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
                                  builder: (context) =>
                                      Doctors_Setting_Page()));
                            },
                            child: Icon(Icons.arrow_forward_ios,
                                size: 20, color: Colors.white),
                          ),
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
