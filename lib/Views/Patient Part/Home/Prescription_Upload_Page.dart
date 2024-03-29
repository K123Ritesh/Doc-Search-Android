import 'dart:io';
import 'package:doc_search/Bottom_Bar.dart';
import 'package:doc_search/Views/Patient%20Part/Home/Order_Done_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';

import '../../../Providers/User_Part_Provider/Medicine_Shop_Provider.dart';

class Prescription_Upload_Page extends StatefulWidget {
  const Prescription_Upload_Page({super.key, required this.shopId});

  final String shopId;
  @override
  State<Prescription_Upload_Page> createState() =>
      _Prescription_Upload_PageState();
}

class _Prescription_Upload_PageState extends State<Prescription_Upload_Page> {
  void showToastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  String fileName = '';
  late File selectedFile;
  List<String> files_list = [];
  void _openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'txt'],
    );

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      for (File file in files) {
        selectedFile = file;
        print("Selected file: ${file.path}");
        fileName = path.basename(file.path).toString();
        for (int i = 0; i < files_list.length; i++) {
          if (files_list[i] == fileName) {
            showToastMessage('You have already Selected this file once');
            return;
          }
        }
        setState(() {
          files_list.add(fileName);
        });
        print(fileName);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final MedicineShopProvider = Provider.of<Medicine_Shop_Provider>(context);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Bottombar(SelectedIndex: 0),
      body: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Padding(
            padding: EdgeInsets.all(8.0.w),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: [
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 15.w,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios_new,
                          color: Colors.black, size: 26),
                    ),
                    SizedBox(
                      width: 60.w,
                    ),
                    Text(
                      'Medicine',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 23.sp,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Center(
                  child: Text(
                    'Upload Your Prescription',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/Images/MedicineStore.png',
                          height: 150.h,
                          width: 400.w,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Medical Store',
                                style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius:
                                          BorderRadius.circular(15.r)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 14.0.w, vertical: 4.h),
                                    child: Row(
                                      children: [
                                        Image.asset('assets/Icons/star.png',
                                            height: 15.h, width: 15.w),
                                        Text('4.5',
                                            style:
                                                TextStyle(color: Colors.white))
                                      ],
                                    ),
                                  ))
                            ],
                          )
                        ],
                      ),
                      Text(
                        'E-13, South Extension Market,Part-II, New Delhi, Delhi 110049',
                        style: TextStyle(
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            for (int i = 0; i < files_list.length; i++)
                              ListTile(
                                title: Text('${files_list[i]}',
                                    style: TextStyle(fontSize: 18.sp)),
                                trailing: Icon(
                                  Icons.check_box_rounded,
                                  color: Colors.green,
                                ),
                              )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _openFilePicker();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: const Color.fromARGB(255, 15, 79, 131)),
                          child: Icon(
                            Icons.add,
                            size: 100,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Add more Prescription',
                        style: TextStyle(
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 15, 79, 131)),
                      ),
                      SizedBox(
                        height: 22.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                files_list.clear();
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 30.w,
                                  vertical: 8.h,
                                ),
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              FirebaseAuth _auth = FirebaseAuth.instance;
                              if (selectedFile != null) {
                                MedicineShopProvider.uploadPrescription(context,
                                    selectedFile, _auth.currentUser!.uid);
                                String? downloadURL =
                                    MedicineShopProvider.downloadURL;
                                if (downloadURL != null) {
                                  print(
                                      'File uploaded. Download URL: $downloadURL');
                                  MedicineShopProvider.createOrderDocument(
                                      context,
                                      _auth.currentUser!.uid,
                                      'shopId',
                                      downloadURL);
                                  MedicineShopProvider.addToMedicineShop(
                                      context,
                                      "shopId",
                                      downloadURL,
                                      _auth.currentUser!.uid);
                                  files_list.clear();
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const Order_Done_Page()));
                                } else {
                                  print('File upload failed.');
                                }
                              } else {
                                showToastMessage(
                                    'Please select at least one file');
                              }
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
                      )
                    ],
                  ),
                )
              ]),
            ),
          )),
    ));
  }
}
