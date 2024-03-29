import 'package:doc_search/Providers/User_Part_Provider/Doctor_Provider.dart';
import 'package:doc_search/Providers/User_Part_Provider/Medicine_Shop_Provider.dart';
import 'package:doc_search/Providers/User_Part_Provider/User_Provider.dart';
import 'package:doc_search/Views/Doctor%20Part/Home/Home_Page.dart';
import 'package:doc_search/Views/Patient%20Part/Authentication/Login_Page.dart';
import 'package:doc_search/Views/Patient%20Part/Home/Home_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Providers/Doctor_Part_Provider/Patient_And_Appointment_Provider.dart';
import 'firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<Patient_And_Appointment_Provider>(
          create: (_) => Patient_And_Appointment_Provider()),
      ChangeNotifierProvider<Medicine_Shop_Provider>(
          create: (_) => Medicine_Shop_Provider()),
      ChangeNotifierProvider<User_Provider>(create: (_) => User_Provider()),
      ChangeNotifierProvider<Doctor_Provider>(create: (_) => Doctor_Provider())
    ],
    child: ScreenUtilInit(
      designSize: const Size(412, 892),
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        );
      },
    ),
  ));
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> isUserLoggedIn() async {
    User? user = _auth.currentUser;
    return user != null;
  }

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  // Function to check login status and navigate accordingly
  void checkLoginStatus() async {
    bool isLoggedIn = await isUserLoggedIn();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isDoctor = await prefs.getBool('isDoctor');
    bool isdoc = isDoctor == null ? false : isDoctor;

    // Delayed navigation based on login status
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => (isLoggedIn && isdoc)
              ? Doctor_Home_Page(
                  docCategory: 'Dentist',
                )
              : (isLoggedIn && !isdoc)
                  ? HomePage()
                  : Login_Page(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Doc',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 4, 72, 127),
                  fontSize: 22,
                ),
              ),
              Text(
                'Search',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 255, 230, 0),
                  fontSize: 22,
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Lottie.asset(
            'assets/lottie/Splash_Animation.json',
          )
        ],
      ),
    );
  }
}
