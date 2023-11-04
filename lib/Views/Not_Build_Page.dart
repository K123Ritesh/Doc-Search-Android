import 'package:doc_search/Bottom_Bar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Not_Build_Page extends StatefulWidget {
  const Not_Build_Page({super.key});

  @override
  State<Not_Build_Page> createState() => _Not_Build_PageState();
}

class _Not_Build_PageState extends State<Not_Build_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // bottomNavigationBar: Bottombar(),
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [Lottie.asset('assets/lottie/UnderConstruction.json')],
    ));
  }
}
