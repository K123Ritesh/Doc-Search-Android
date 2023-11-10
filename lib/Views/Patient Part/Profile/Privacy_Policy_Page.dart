import 'package:doc_search/Bottom_Bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Privacy_Policy_Page extends StatefulWidget {
  const Privacy_Policy_Page({super.key});

  @override
  State<Privacy_Policy_Page> createState() => _Privacy_Policy_PageState();
}

class _Privacy_Policy_PageState extends State<Privacy_Policy_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // bottomNavigationBar: Bottombar(SelectedIndex: 3),
        body: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF155467),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0.w),
              child: ListView(children: [
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
                          color: Colors.white, size: 26),
                    ),
                    SizedBox(
                      width: 70.w,
                    ),
                    Text(
                      'Privacy Policy',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23.sp,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Privacy Policy For Doc Search',
                      style: TextStyle(
                          fontSize: 19.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Effective Date : 25/12/2023',
                      style: TextStyle(
                          fontSize: 19.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(10.0.w),
                  child: Text(
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400),
                      'Egestas tempus orci tortor sed. Non urna tincidunt pulvinar rutrum in a. Sed aliquam tortor feugiat scelerisque amet. Maecenas morbi nisl molestie a gravida integer. Aliquet integer libero malesuada ullamcorper molestie mattis mi fringilla. Venenatis praesent enim id eu platea venenatis hendrerit. Laoreet viverra aenean non diam. In arcu ullamcorper bibendum molestie non nunc dui purus commodo. Orci vel facilisi amet nunc massa neque.\n Egestas adipiscing non quam morbi amet egestas ullamcorper duis. Nunc semper duis sit felis. Placerat sed commodo euismod diam blandit dictumst congue gravida. Enim cras augue feugiat nunc aliquet. Mus enim consectetur natoque non. Ut viverra volutpat eget mi tristique rutrum. Gravida arcu aliquet est nisl.\ntortor urna ornare eget. Et ornare faucibus pulvinar volutpat sed pharetra dis accumsan sit. Lacus porttitor in elementum egestas lobortis venenatis aenean tincidunt arcu. Turpis sollicitudin arcu aliquam id egestas in. Vestibulum diam adipiscing faucibus id. Ac arcu vitae pellentesque risus amet a fames eget. Mauris et enim viverra semper cursus. Gravida arcu aliquet est nisl tortor urna.'),
                )
              ]),
            )),
      ),
    );
  }
}
