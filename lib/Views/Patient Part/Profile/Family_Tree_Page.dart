import 'package:doc_search/Providers/User_Part_Provider/User_Provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Family_Tree_Page extends StatefulWidget {
  const Family_Tree_Page({super.key});

  @override
  State<Family_Tree_Page> createState() => _Family_Tree_PageState();
}

class _Family_Tree_PageState extends State<Family_Tree_Page> {
  int n = 1;
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<User_Provider>(context);
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
                    child: userProvider.user.profilePicUrl == ' '
                        ? Icon(Icons.person, color: Colors.blue, size: 90)
                        : ClipOval(
                            child: Image.network(
                              userProvider.user.profilePicUrl,
                              width: 95.0.w,
                              height: 95.0.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                    maxRadius: 50.r,
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  '${userProvider.user.firstName} ${userProvider.user.lastName}',
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  '${userProvider.user.age} Years',
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  '${userProvider.user.address}',
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  '${userProvider.user.mobileNo}',
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
                      if (n <= 5) {
                        n++;
                      }
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
                  onTap: () {
                    Navigator.pop(context);
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
  Person_Details({super.key, required this.n});
  final int n;
  List<String> suffix = ['st', 'nd', 'rd', 'th', 'th', 'th'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${n + 1}${suffix[n]} Person',
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
        RoundedTextField(hintText: 'Aadhar Number'),
        SizedBox(
          height: 15.h,
        ),
        RoundedDropdownField(
            labelText: 'Relation',
            items: ['Mother', 'Father', 'Wife', 'Brother', 'Sister', 'Child']),
        SizedBox(),
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
        readOnly: true,
        onTap: () {
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
