import 'package:doc_search/Views/Doctor%20Part/Profile/Appointments.dart';

import 'package:flutter/material.dart';
import 'Views/Doctor Part/Home/Home_Page.dart';
import 'Views/Doctor Part/Profile/Profile_Page.dart';

class DoctorBottombar extends StatefulWidget {
  final int SelectedIndex;
  final String docCategory;

  const DoctorBottombar(
      {super.key, required this.docCategory, required this.SelectedIndex});
  State<DoctorBottombar> createState() => _DoctorBottombarState();
}

class _DoctorBottombarState extends State<DoctorBottombar> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = widget.SelectedIndex;
    void onTabTapped(int index) {
      setState(() {
        currentIndex = index;
      });

      switch (index) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Doctor_Home_Page(
                      docCategory: widget.docCategory,
                    )),
          );
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Doctor_appointments(
                      docCategory: widget.docCategory,
                    )),
          );
          break;
        case 2:
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => Not_Build_Page(selectedIndex: 2)),
          // );
          break;
        case 3:
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Doctor_Profile_Page(
                      docCategory: widget.docCategory,
                    )),
          );
          break;
        // Add more cases for additional pages if needed
      }
    }

    return Container(
      height: 68,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(33.0),
        //   topRight: Radius.circular(33.0),
        // ),
        // boxShadow: const [
        //   BoxShadow(
        //     color: Color.fromARGB(255, 234, 165, 165),
        //     blurRadius: 10.0,
        //     offset: Offset(0, -3),
        //   ),
        // ],
        boxShadow: [
          BoxShadow(
            color: Color(0XFF005473),
            blurRadius: 5.0,
            offset: Offset(-1, -1),
          ),
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 3,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            label: 'Appointment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: currentIndex,
        onTap: onTabTapped,
        unselectedItemColor: Colors.black,
        selectedItemColor: Color(0XFF005473),
        selectedLabelStyle: TextStyle(color: Color(0XFF005473)),
      ),
    );
  }
}
