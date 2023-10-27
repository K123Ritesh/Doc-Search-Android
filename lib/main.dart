import 'package:doc_search/Demo_Page.dart';
import 'package:doc_search/Home_Page.dart';
import 'package:doc_search/Profile_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Change the system status bar and navigation bar colors here
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(255, 3, 110, 198)
        // Set the status bar color
        // systemNavigationBarColor: Colors.blue, // Set the navigation bar color
        ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Doc_Search(),
    );
  }
}

class Doc_Search extends StatefulWidget {
  const Doc_Search({super.key});

  @override
  State<Doc_Search> createState() => _Doc_SearchState();
}

class _Doc_SearchState extends State<Doc_Search> {
  final List<Widget> _pages = [
    Home_Page(),
    Demo_Page(),
    Demo_Page(),
    Profile_Page_Doc_Search(),
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        selectedItemColor: Colors.red,
        selectedFontSize: 16,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.help,
              color: Colors.black,
            ),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
              color: Colors.black,
            ),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
