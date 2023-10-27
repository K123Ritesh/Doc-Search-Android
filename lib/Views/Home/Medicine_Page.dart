import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_search/Models/Medicine_Shop.dart';
import 'package:doc_search/Views/Home/Prescription_Upload_Page.dart';
import 'package:doc_search/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../Controllers/Medicine_Shop_Controller.dart';

class Medicine_Page extends StatefulWidget {
  Medicine_Page({super.key});

  @override
  State<Medicine_Page> createState() => _Medicine_PageState();
}

class _Medicine_PageState extends State<Medicine_Page> {
  List<MedicineShop> acc_to_search = [];

  Future<void> getMedicineShopsByPincode(String city) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Medicine_Shops')
          .where('city', isEqualTo: city.toLowerCase())
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        acc_to_search.assignAll(
          querySnapshot.docs
              .map((shop) => MedicineShop(
                    email: shop['email'],
                    name: shop['name'],
                    pincode: shop['pin_code'],
                    address: shop['address'],
                  ))
              .toList(),
        );
        print(acc_to_search);
        for (int i = 0; i < acc_to_search.length; i++) {
          print('${i + 1} th MEDICINE SHOP');
          print(acc_to_search[i].address);
          print(acc_to_search[i].name);
          print(acc_to_search[i].pincode);
        }
      } else {
        print('No medicine shops found for pincode $city');
        acc_to_search.clear();
      }
    } catch (e) {
      print('Error retrieving medicine shops: $e');
    }
  }

  int ans = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
    return SafeArea(
        child: Scaffold(
      body: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios_new,
                          color: Colors.black, size: 26),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      'Medicine',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    'Find a Medical Store near by',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text('Your area/Pincode',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 9, 76, 132),
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Background color
                      borderRadius:
                          BorderRadius.circular(25.0), // Rounded corners
                    ),
                    child: TextField(
                      onTap: () {
                        setState(() {
                          ans = 0;
                        });
                      },
                      onChanged: (value) {
                        getMedicineShopsByPincode(value);
                      },
                      onSubmitted: (value) {
                        setState(() {
                          ans = 1;
                        });
                        getMedicineShopsByPincode(value);
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
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text('Famous Medical Stores',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ans == 1
                    ? acc_to_search_widget(acc_to_search: acc_to_search)
                    : Center(
                        child: Text(
                          'Enter the city to search',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                      )
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
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 7.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Container(
              color: const Color.fromARGB(255, 229, 233, 236),
              width: 150,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
                child: Image.network(
                  'https://s3-alpha-sig.figma.com/img/794b/f823/888e96939d2cdc3a020b483113f691e6?Expires=1699228800&Signature=VseIWQAWN33pNICILnj70LXfeN6memzt6Z-OCXz6IAqpv3V~87ADxWi0O7vHJtwfhjhkrltSjReikFhEgjMl~USyfilpabpN4cKIfJPdqz6rKUTFw6Qk2HWsT8cSirCOmPcHzmnLGUhhTSeqraR-UfUmkb79IWvL9JWFl~HPNllntFDok0nUHs0fa0brCyv6Lu55KKensPkenhRfCW1nUc8p0tj3iqELCd5UdakJFKdrTrbM7qaXJpLWyJcCZpn5f42QSfRlqAJj6v6s5KMxzU0T48DiJI241aPBbYr0iwzGHnK9ySVa7PB3iUC1vBlOBkgn3W33ueEpxWIjrH~8Jg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                  width: 150,
                  height: 150,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              width: 190,
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14.0, vertical: 4),
                            child: Row(
                              children: [
                                Image.network(
                                    'https://s3-alpha-sig.figma.com/img/6b44/dfe8/5c57af73afca6dcfe03f4edefe50e0d8?Expires=1699228800&Signature=Lr3Xoqc42oUgyw5W-edowlsanrCojTS6AGSLTprSiVaLqanRw6UMsk33zhZeJFeEmHw7fcp9m9hu2xA0iiPAxg2XmR2qWDEp8DyTMw0uSL3NwdSspGPq69NY1a-5xCBdWmFnRGRd1g-nx-83Gjc7zKmiBLShElK6UObuPx9K3nnsvLd8TCAt4E23Y3pdzDtmiT5jJri5n55E7kHO6etZGfoVryhiWEH7jHL8cEP-qoRrKx4in8xm8AZts6XBM7k2DgCSXmrUmI6X5YGwMwGpGG6Z74Pfc8TKgzFv5bp2ilKmulUbag0ID37DphiT2G2lpPExL2r-xAkR3dffovWEZA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                                    height: 15,
                                    width: 15),
                                Text('4.5',
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                          ))
                    ],
                  ),
                  Text(
                    '$name',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      '$address',
                      style: TextStyle(
                          fontSize: 17,
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
                              builder: (context) => Prescription_Upload_Page(
                                    shopId: '',
                                  )));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 69, 13, 222),
                              borderRadius: BorderRadius.circular(10)),
                          // height: 40,
                          // width: 230,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4),
                            child: Center(
                              child: Text(
                                'Upload Your Prescription',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
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
    );
  }
}

class acc_to_search_widget extends StatelessWidget {
  const acc_to_search_widget({super.key, required this.acc_to_search});

  final List<MedicineShop> acc_to_search;

  @override
  Widget build(BuildContext context) {
    int n = acc_to_search.length;
    return n == 0
        ? Center(child: Text('No Results Found'))
        : SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                for (int i = 0; i < n; i++)
                  Container_For_Medicine_Store(
                      shopid: acc_to_search[i].email,
                      name: acc_to_search[i].name,
                      address: acc_to_search[i].address)
              ],
            ),
          );
  }
}
