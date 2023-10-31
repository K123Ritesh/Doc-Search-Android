import 'package:doc_search/Bottom_Bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class Medical_Labs_Details_Page extends StatefulWidget {
  const Medical_Labs_Details_Page(
      {super.key,
      required this.name,
      required this.address,
      required this.contactInfo1,
      required this.contactInfo2,
      required this.detailedAddress});

  final String name;
  final String address;
  final String contactInfo1;
  final String contactInfo2;
  final String detailedAddress;

  @override
  State<Medical_Labs_Details_Page> createState() =>
      _Medical_Labs_Details_PageState();
}

class _Medical_Labs_Details_PageState extends State<Medical_Labs_Details_Page> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Bottombar(),
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
                    'Medical Lab',
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
                  'Find a Medical Lab near by',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        'https://s3-alpha-sig.figma.com/img/8e99/156b/3966a970d29e00d2c9fbcba8ec97dc4e?Expires=1699228800&Signature=G4XfzM8KQXWwPmgeIybKPpafP-qyHsr9ykClrm01kpDSs58y~izeZF7mvopK5MV6PqM6UAqHF-hzxPtslq3sl~ZXTW50InN6W6apRCJsIW2TJD4NRlkL4zHsjhPdELTLmu4BO4pA8rv~Om-a3ktOGbFSQzeRDomPUd0YA5H~IMWjiphojGAHn9O~xvAv3eM8a28rF4QmGHGbXbewBFqVJdy4aO3KRYF3BgCCoXvYv3rvChc7j68LW0aiLAtjXTs5fCfHllT2MqrBNoNf-mkSADtO2bJzX~XirR21BjQEJL9j65ov7NcjSJ14BsQ8F1giwxzglFauHnZXvsOWAHxwgw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                        height: 150,
                        width: 400,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Pathology Lab',
                              style: TextStyle(
                                  fontSize: 22,
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
                        )
                      ],
                    ),
                    Text(
                      '${widget.detailedAddress}',
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () async {
                            final phoneNumber = "${widget.contactInfo1}";
                            final url = "tel:$phoneNumber";

                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              print("Could not launch $url");
                            }
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14.0, vertical: 4),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('${widget.contactInfo1}',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20))
                                  ],
                                ),
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () async {
                            final phoneNumber = "${widget.contactInfo2}";
                            final url = "tel:$phoneNumber";

                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              print("Could not launch $url");
                            }
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14.0, vertical: 4),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('${widget.contactInfo2}',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20))
                                  ],
                                ),
                              )),
                        )
                      ],
                    )
                  ],
                ),
              )
            ]),
          )),
    ));
  }
}
