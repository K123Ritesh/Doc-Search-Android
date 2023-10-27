import 'package:flutter/material.dart';

class Demo_Page extends StatefulWidget {
  const Demo_Page({super.key});

  @override
  State<Demo_Page> createState() => _Demo_PageState();
}

class _Demo_PageState extends State<Demo_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
