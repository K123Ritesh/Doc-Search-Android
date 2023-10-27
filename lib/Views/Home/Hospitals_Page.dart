import 'package:doc_search/Views/Home/Hospital_Details_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Hospitals_Page extends StatefulWidget {
  const Hospitals_Page({super.key});

  @override
  State<Hospitals_Page> createState() => _Hospitals_PageState();
}

class _Hospitals_PageState extends State<Hospitals_Page> {
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
            child: ListView(children: [
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
                    'Hospital',
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
                  'Find a Hospital near by',
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
                    decoration: InputDecoration(
                      hintText: 'Search Location',
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
                  Text('Famous Hospitals',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container_For_Medicine_Store(),
              Container_For_Medicine_Store(),
              Container_For_Medicine_Store(),
              Container_For_Medicine_Store(),
              Container_For_Medicine_Store()
            ]),
          )),
    ));
  }
}

class Container_For_Medicine_Store extends StatelessWidget {
  const Container_For_Medicine_Store({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 7.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Hospital_Details_Page()));
        },
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
                    'https://s3-alpha-sig.figma.com/img/d4e4/12ce/d1008e327b56d8c4e7301fb473835610?Expires=1699228800&Signature=ahSB1ooKl-J~~bhHfXQul3BCQHfNIb5BhupKfwUxN9PYBa21BOeK8IB~GhzttIfeqMdMSgET6I6kvXAvrmF2hed11Xx0BzA09W6Icn8OIIahnwWxlX4yfAM8FMSE3w7~RescVjojns3THqu6q9kdIwY-RRdEzULnW7cDtgYFhRNrLeyj4DHnHaruNP2CAo7Dgx~eNIexDLIbYKZ3XrkZmGtdpkrbkI6HYkT~VJbwuRAaitE9E9Z3haIw7ZLpcsTfLNIkCm0qM0e3tVLx-aHV8j64dv6XxFnruPzLzpkjsg1fuAA3xAuUkz-0tx7PJsmVOZt4f1htO~Hi1bieMca7Kg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
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
                      'Paras Hospital',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        'E-13, South Extension Market, Part-II, New Delhi',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
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
                                'Call Now',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
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
