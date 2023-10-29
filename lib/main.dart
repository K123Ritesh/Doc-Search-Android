import 'package:doc_search/Providers/Doctor_Provider.dart';
import 'package:doc_search/Providers/Medicine_Shop_Provider.dart';
import 'package:doc_search/Views/Authentication/Login_Page.dart';
import 'package:doc_search/Views/Home/Home_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
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

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Login_Page();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'otp',
          builder: (BuildContext context, GoRouterState state) {
            return OTP_Entering_Page();
          },
        ),
        GoRoute(
          path: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return HomePage();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(255, 3, 110, 198)));
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
