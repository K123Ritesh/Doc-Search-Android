import 'package:doc_search/Providers/User_Provider.dart';
import 'package:doc_search/Views/Final_Home_Page.dart';
import 'package:doc_search/Views/Not_Build_Page.dart';
import 'package:doc_search/Views/Patient%20Part/Home/Home_Page.dart';
import 'package:doc_search/Views/Patient%20Part/Home/Wallet_Page.dart';
import 'package:doc_search/Views/Patient%20Part/Profile/Profile_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Views/Patient Part/Appointment/PastApointment.dart';
import 'Views/Patient Part/Profile/Appointments_Page.dart';

class Bottombar extends StatefulWidget {
  @override
  final int SelectedIndex;

  const Bottombar({super.key, required this.SelectedIndex});
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  String getCurrentUserUid() {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      String uid = user.uid;
      return uid;
    } else {
      return "User not authenticated";
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<User_Provider>(context);
    int currentIndex = widget.SelectedIndex;
    void onTabTapped(int index) {
      setState(() {
        currentIndex = index;
      });
      if (currentIndex == 1) {
        userProvider.getTodayAppointments(context);
        userProvider.getPastAppointments(context);
        userProvider.getUpcomingAppointments(context);
        userProvider.getPastAppointmentModels(context);
        userProvider.getTodayAppointmentModels(context);
        userProvider.getUpcomingAppointmentModels(context);
      }

      if (currentIndex == 0) {
        String uid = getCurrentUserUid();
        print(uid);
        userProvider.getUserDetails(context, uid);
      }

      switch (index) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
          break;
        case 1:
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) =>
                  (userProvider.todayAppointmentModel.length == 0 &&
                          userProvider.todayAppointmentModel.length == 0 &&
                          userProvider.todayAppointmentModel.length == 0)
                      ? Appointments_Page()
                      : PastAppointment()));
          break;
        case 2:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Wallet()),
          );
          break;
        case 3:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Profile_Page_Doc_Search()),
          );
          break;
        // Add more cases for additional pages if needed
      }
    }

    return Container(
      height: 68,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(33.0),
          topRight: Radius.circular(33.0),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 234, 165, 165),
            blurRadius: 10.0,
            offset: Offset(0, -3),
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
            icon: Icon(Icons.wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: currentIndex,
        onTap: onTabTapped,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        selectedLabelStyle: TextStyle(color: Colors.blue),
      ),
    );
  }
}
