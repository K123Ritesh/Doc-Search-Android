import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Family_Tree_Page extends StatefulWidget {
  const Family_Tree_Page({super.key});

  @override
  State<Family_Tree_Page> createState() => _Family_Tree_PageState();
}

class _Family_Tree_PageState extends State<Family_Tree_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1A6A83),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Container(
              margin: const EdgeInsets.only(left: 70),
              child: const Text(
                'Family Tree',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              )),
        ),
        body: ListView(
          children: const [
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Add Family Members',
                  style: TextStyle(fontSize: 21),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Please provide following information ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Person_Details extends StatelessWidget {
  const Person_Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RoundedTextField(hintText: 'Full Name'),
      ],
    );
  }
}

class RoundedTextField extends StatelessWidget {
  final String hintText;

  RoundedTextField({required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.w,
      height: 40.h, // Adjust the width as needed
      padding: EdgeInsets.only(left: 8.0.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class RoundedDropdownField extends StatefulWidget {
  final String labelText;
  final List<String> items;

  RoundedDropdownField({required this.labelText, required this.items});

  @override
  _RoundedDropdownFieldState createState() => _RoundedDropdownFieldState();
}

class _RoundedDropdownFieldState extends State<RoundedDropdownField> {
  String? _selectedItem;
  TextEditingController text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.w,
      height: 40.h, // Adjust the width as needed
      padding: EdgeInsets.only(left: 8.0.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: TextField(
        controller: text,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ListView(
                      children: widget.items.map((item) {
                        return ListTile(
                          title: Text(item),
                          onTap: () {
                            setState(() {
                              _selectedItem = item;
                              text.text = item;
                            });
                            Navigator.pop(context);
                          },
                        );
                      }).toList(),
                    );
                  },
                );
              },
              icon: Icon(Icons.arrow_drop_down)),
          hintText: widget.labelText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
