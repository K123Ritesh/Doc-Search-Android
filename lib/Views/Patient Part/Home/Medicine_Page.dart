import 'package:doc_search/Models/Medicine_Shop.dart';
import 'package:doc_search/Providers/User_Part_Provider/Medicine_Shop_Provider.dart';
import 'package:doc_search/Providers/User_Part_Provider/User_Provider.dart';
import 'package:doc_search/Views/Patient%20Part/Home/Prescription_Upload_Page.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

import '../../../Bottom_Bar.dart';

class Medicine_Page extends StatefulWidget {
  Medicine_Page({super.key});

  @override
  State<Medicine_Page> createState() => _Medicine_PageState();
}

class _Medicine_PageState extends State<Medicine_Page> {
  @override
  void initState() {
    super.initState();
    Provider.of<Medicine_Shop_Provider>(context, listen: false)
        .getFamousShops(context);
  }

  int ans = 1;
  TextEditingController searchedCity = TextEditingController();

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
                    'Find a Medical Store near by',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: Text('Your area/Pincode',
                      style: TextStyle(
                          color: Color.fromARGB(255, 9, 76, 132),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Background color
                      borderRadius:
                          BorderRadius.circular(25.0.r), // Rounded corners
                    ),
                    child: TextField(
                      controller: searchedCity,
                      onChanged: (value) {
                        if (searchedCity.toString() != '') {
                          setState(() {
                            ans = 0;
                          });
                          MedicineShopProvider.getAccToSearch(value, context);
                        }
                      },
                      onSubmitted: (value) {
                        if (searchedCity.toString() != '') {
                          setState(() {
                            ans = 0;
                          });
                          MedicineShopProvider.getAccToSearch(value, context);
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Search your city',
                        hintStyle: TextStyle(
                            color: const Color.fromARGB(255, 82, 78, 78)),
                        prefixIcon: Icon(Icons.search,
                            color: Color.fromARGB(255, 13, 76, 127)),
                        border: InputBorder.none, // Remove default underline
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                // Row(
                //   children: [
                //     SizedBox(
                //       width: 10,
                //     ),
                //     Text('Famous Medical Stores',
                //         style: TextStyle(
                //             color: Colors.black,
                //             fontSize: 20,
                //             fontWeight: FontWeight.bold)),
                //   ],
                // ),
                SizedBox(
                  height: 10.h,
                ),
                ans == 1 || searchedCity.toString() == ''
                    ? MedicineShopProvider.isLoading_famous == true
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : famous_shops(
                            acc_to_search: MedicineShopProvider.famousShops)
                    : acc_to_search_widget(
                        acc_to_search: MedicineShopProvider.acc_to_Search,
                      ),
              ]),
            ),
          )),
    ));
  }
}

class Container_For_Medicine_Store extends StatelessWidget {
  Container_For_Medicine_Store(
      {super.key,
      required this.name,
      required this.address,
      required this.shopid});

  final String name;
  final String address;
  final String shopid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0.w, vertical: 7.0.h),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Prescription_Upload_Page(
                    shopId: '',
                  )));
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(15.r)),
          child: Row(
            children: [
              Container(
                color: const Color.fromARGB(255, 229, 233, 236),
                width: 150.w,
                height: 150.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.r),
                      bottomLeft: Radius.circular(15.r)),
                  child: Image.network(
                    'https://s3-alpha-sig.figma.com/img/794b/f823/888e96939d2cdc3a020b483113f691e6?Expires=1699228800&Signature=VseIWQAWN33pNICILnj70LXfeN6memzt6Z-OCXz6IAqpv3V~87ADxWi0O7vHJtwfhjhkrltSjReikFhEgjMl~USyfilpabpN4cKIfJPdqz6rKUTFw6Qk2HWsT8cSirCOmPcHzmnLGUhhTSeqraR-UfUmkb79IWvL9JWFl~HPNllntFDok0nUHs0fa0brCyv6Lu55KKensPkenhRfCW1nUc8p0tj3iqELCd5UdakJFKdrTrbM7qaXJpLWyJcCZpn5f42QSfRlqAJj6v6s5KMxzU0T48DiJI241aPBbYr0iwzGHnK9ySVa7PB3iUC1vBlOBkgn3W33ueEpxWIjrH~8Jg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                    width: 150.w,
                    height: 150.h,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                width: 180.w,
                height: 150.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(15.r)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 14.0.w, vertical: 4.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image.network(
                                      'https://s3-alpha-sig.figma.com/img/6b44/dfe8/5c57af73afca6dcfe03f4edefe50e0d8?Expires=1699228800&Signature=Lr3Xoqc42oUgyw5W-edowlsanrCojTS6AGSLTprSiVaLqanRw6UMsk33zhZeJFeEmHw7fcp9m9hu2xA0iiPAxg2XmR2qWDEp8DyTMw0uSL3NwdSspGPq69NY1a-5xCBdWmFnRGRd1g-nx-83Gjc7zKmiBLShElK6UObuPx9K3nnsvLd8TCAt4E23Y3pdzDtmiT5jJri5n55E7kHO6etZGfoVryhiWEH7jHL8cEP-qoRrKx4in8xm8AZts6XBM7k2DgCSXmrUmI6X5YGwMwGpGG6Z74Pfc8TKgzFv5bp2ilKmulUbag0ID37DphiT2G2lpPExL2r-xAkR3dffovWEZA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                                      height: 15.h,
                                      width: 15.w),
                                  Text('4.5',
                                      style: TextStyle(color: Colors.white))
                                ],
                              ),
                            ))
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.w, top: 10.h),
                      child: Text(
                        name,
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.w),
                      child: Text(
                        address,
                        style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const Prescription_Upload_Page(
                                      shopId: '',
                                    )));
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 10.h),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 69, 13, 222),
                                borderRadius: BorderRadius.circular(10.r)),
                            // height: 40,
                            // width: 230,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0.w, vertical: 4.h),
                              child: Center(
                                child: Text(
                                  'Upload Your Prescription',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class acc_to_search_widget extends StatelessWidget {
  const acc_to_search_widget({super.key, required this.acc_to_search});

  final List<MedicineShop>? acc_to_search;

  @override
  Widget build(BuildContext context) {
    final MedicineShopProvider = Provider.of<Medicine_Shop_Provider>(context);
    return MedicineShopProvider.isLoading_Search == true
        ? Center(
            child: CircularProgressIndicator(),
          )
        : acc_to_search == null
            ? SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Text(
                      'No Results Found for your City',
                      style: TextStyle(fontSize: 20.sp, color: Colors.black),
                    )),
                  ],
                ))
            : SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Text('Found ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold)),
                        Text('${acc_to_search!.length}',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold)),
                        Text(' Medical Stores near you',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    for (int i = 0; i < acc_to_search!.length; i++)
                      Container_For_Medicine_Store(
                          shopid: acc_to_search![i].email,
                          name: acc_to_search![i].name,
                          address: acc_to_search![i].address)
                  ],
                ),
              );
  }
}

class famous_shops extends StatelessWidget {
  const famous_shops({super.key, required this.acc_to_search});

  final List<MedicineShop>? acc_to_search;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 10.w,
              ),
              Text('Famous Medical Stores',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          for (int i = 0; i < acc_to_search!.length; i++)
            Container_For_Medicine_Store(
                shopid: acc_to_search![i].email,
                name: acc_to_search![i].name,
                address: acc_to_search![i].address)
        ],
      ),
    );
  }
}
