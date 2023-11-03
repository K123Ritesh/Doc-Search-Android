import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Family_Tree_Page extends StatefulWidget {
  const Family_Tree_Page({super.key});

  @override
  State<Family_Tree_Page> createState() => _Family_Tree_PageState();
}

class _Family_Tree_PageState extends State<Family_Tree_Page> {
  int n = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF1A6A83),
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
              margin: EdgeInsets.only(left: 70.w),
              child: Text(
                'Family Tree',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
              )),
        ),
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 85.h,
                  width: 85.w,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    // You can add the image here
                    // backgroundImage: NetworkImage('URL'),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Vivek Sharma',
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  '27 Years',
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'B-9 Vasnat Kunj New Delhi',
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  '+91 9876543210',
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30.w,
                ),
                Text(
                  'Add Family Members',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23.sp,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 35.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Please provide following information ',
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            for (int i = 0; i < n; i++) Person_Details(n: i),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      n++;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 15, 79, 131),
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 33.w,
                        vertical: 8.h,
                      ),
                      child: Text(
                        'Add more',
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 15, 79, 131),
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 33.w,
                        vertical: 8.h,
                      ),
                      child: Text(
                        'Save',
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            )
          ],
        ),
      ),
    );
  }
}

class Person_Details extends StatelessWidget {
  const Person_Details({super.key, required this.n});
  final int n;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${n + 1} Person',
          style: TextStyle(
              color: Colors.white,
              fontSize: 21.sp,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 15.h,
        ),
        RoundedTextField(hintText: 'Full Name'),
        SizedBox(
          height: 15.h,
        ),
        RoundedTextField(hintText: 'Full Name'),
        SizedBox(
          height: 15.h,
        ),
        RoundedDropdownField(
            labelText: 'Relation',
            items: ['Mother', 'Father', 'Wife', 'Brother', 'Sister']),
        SizedBox(
          height: 15.h,
        ),
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
      width: 350.w,
      height: 50.h, // Adjust the width as needed
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
      width: 350.w,
      height: 50.h, // Adjust the width as needed
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
