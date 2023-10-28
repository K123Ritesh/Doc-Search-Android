import 'package:doc_search/Models/Doctor.dart';
import 'package:doc_search/Providers/Medicine_Shop_Provider.dart';
import 'package:doc_search/Splash_Screen.dart';
import 'package:doc_search/Views/Authentication/Login_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List<Doctor> acc_to_search = [];

Future<void> doctorsByCity(String city) async {
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Dentist')
        .where('city', isEqualTo: city.toLowerCase())
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      acc_to_search.assignAll(
        querySnapshot.docs
            .map((doctor) => Doctor(
                rating: doctor['rating'],
                reg_fee: doctor['reg_fee'],
                sitting_days: doctor['sitting_days'],
                city: doctor['city'],
                experience: doctor['experience'],
                bookings_for_today: doctor['Bookings_for_today'],
                name: doctor['name'],
                pincode: doctor['pin_code'],
                address: doctor['address']))
            .toList(),
      );
      // print(acc_to_search);
      for (int i = 0; i < acc_to_search.length; i++) {
        print('${i + 1} th Doctor in the CITY');
        print(acc_to_search[i].address);
        print(acc_to_search[i].name);
        print(acc_to_search[i].pincode);
        print(acc_to_search[i].bookings_for_today);
        if (acc_to_search[i].bookings_for_today['9:00 - 10:00'] != null) {
          print(acc_to_search[i].bookings_for_today['9:00 - 10:00']);
        } else {
          print('No booking');
        }
      }
    } else {
      print('No Doctors found for pincode $city');
      acc_to_search.clear();
    }
  } catch (e) {
    print('Error retrieving doctors: $e');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // doctorsByCity('kolkata');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Medicine_Shop_Provider>(
            create: (_) => Medicine_Shop_Provider())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color.fromARGB(255, 3, 110, 198)));
    return MaterialApp(debugShowCheckedModeBanner: false, home: Login_Page());
  }
}
