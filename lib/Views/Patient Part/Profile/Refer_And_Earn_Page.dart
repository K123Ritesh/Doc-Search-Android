import 'package:doc_search/Bottom_Bar.dart';
import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class Refer_And_Earn_Page extends StatefulWidget {
  const Refer_And_Earn_Page({super.key});

  @override
  State<Refer_And_Earn_Page> createState() => _Refer_And_Earn_PageState();
}

class _Refer_And_Earn_PageState extends State<Refer_And_Earn_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF155467),
        bottomNavigationBar: Bottombar(SelectedIndex: 3),
        body: SingleChildScrollView(
          child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF155467),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0.w),
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
                            color: Colors.white, size: 26),
                      ),
                      SizedBox(
                        width: 80.w,
                      ),
                      Text(
                        'Refer and Earn',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 23.sp,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Image.asset(
                    "assets/Icons/image 59.png",
                    height: 270.h,
                    width: 298.w,
                  ),
                  Text(
                    "Sharing is Rewarding",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Get 100 in your DOC search wallet \n       when you invite your friend",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    "Refer Using Refferal code",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ReferralCodeBox(referralCode: "XYzRC3"),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                      child: Text(
                    'OR',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        height: 33.h,
                        width: 230.w,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                height: 24.h,
                                width: 30.w,
                                'assets/Icons/image 57.png',
                              ),
                              Text(
                                'Refer via Whatsapp',
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 65, 255, 71),
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          final content =
                              "Check out this amazing video: https://example.com/video"; // Replace with your video or link content

                          final url =
                              "https://wa.me/?text=${Uri.encodeComponent(content)}";
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            // Handle errors if WhatsApp couldn't be launched
                            print("Could not launch WhatsApp");
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          height: 33.h,
                          width: 230.w,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(
                                  height: 24.h,
                                  width: 30.w,
                                  'assets/Icons/Facebook Logo.png',
                                ),
                                Text(
                                  'Refer via Facebook',
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 29, 107, 171),
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ]),
              )),
        ),
      ),
    );
  }
}

class ReferralCodeBox extends StatelessWidget {
  final String referralCode;

  ReferralCodeBox({required this.referralCode});

  void copyToClipboard(String text, context) {
    FlutterClipboard.copy(text).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Copied to clipboard: $text'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 260.w,
      decoration: BoxDecoration(
          color: Colors.white, border: Border.all(color: Colors.black)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              referralCode,
              style: TextStyle(
                color: const Color.fromARGB(255, 255, 30, 14),
                fontSize: 20.0.sp,
              ),
            ),
            SizedBox(height: 16.0.h),
            InkWell(
              onTap: () {
                copyToClipboard(referralCode, context);
              },
              child: Icon(
                Icons.content_copy,
                color: Colors.blue,
                size: 25.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
