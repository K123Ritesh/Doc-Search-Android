import 'package:doc_search/Views/Authentication/Login_Page.dart';
import 'package:doc_search/Views/Home/Consultancy_Page.dart';
import 'package:doc_search/Views/Home/Hospitals_Page.dart';
import 'package:doc_search/Views/Home/Medical_Labs_Page.dart';
import 'package:doc_search/Views/Home/Medicine_Page.dart';
import 'package:doc_search/Views/Profile/Demo_Page.dart';
import 'package:doc_search/Views/Home/Home_Page.dart';
import 'package:doc_search/Views/Profile/Profile_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color.fromARGB(255, 3, 110, 198)));
    return GetMaterialApp(
        debugShowCheckedModeBanner: false, home: Login_Page());
  }
}
