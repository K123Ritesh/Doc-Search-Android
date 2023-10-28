import 'package:doc_search/Providers/Doctor_Provider.dart';
import 'package:doc_search/Providers/Medicine_Shop_Provider.dart';

import 'package:doc_search/Views/Authentication/Login_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Medicine_Shop_Provider>(
            create: (_) => Medicine_Shop_Provider()),
        ChangeNotifierProvider<Doctor_Provider>(
            create: (_) => Doctor_Provider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(255, 3, 110, 198)));
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: Login_Page());
  }
}
