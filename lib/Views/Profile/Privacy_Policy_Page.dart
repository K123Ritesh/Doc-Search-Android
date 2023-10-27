import 'package:flutter/material.dart';

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
        body: Container(
            decoration: BoxDecoration(color: Color.fromARGB(255, 3, 110, 198)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                          color: Colors.white, size: 26),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Text(
                      'Privacy Policy',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Privacy Policy For Doc Search',
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Effective Date : 25/12/2023',
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                      'Egestas tempus orci tortor sed. Non urna tincidunt pulvinar rutrum in a. Sed aliquam tortor feugiat scelerisque amet. Maecenas morbi nisl molestie a gravida integer. Aliquet integer libero malesuada ullamcorper molestie mattis mi fringilla. Venenatis praesent enim id eu platea venenatis hendrerit. Laoreet viverra aenean non diam. In arcu ullamcorper bibendum molestie non nunc dui purus commodo. Orci vel facilisi amet nunc massa neque.\n Egestas adipiscing non quam morbi amet egestas ullamcorper duis. Nunc semper duis sit felis. Placerat sed commodo euismod diam blandit dictumst congue gravida. Enim cras augue feugiat nunc aliquet. Mus enim consectetur natoque non. Ut viverra volutpat eget mi tristique rutrum. Gravida arcu aliquet est nisl.\ntortor urna ornare eget. Et ornare faucibus pulvinar volutpat sed pharetra dis accumsan sit. Lacus porttitor in elementum egestas lobortis venenatis aenean tincidunt arcu. Turpis sollicitudin arcu aliquam id egestas in. Vestibulum diam adipiscing faucibus id. Ac arcu vitae pellentesque risus amet a fames eget. Mauris et enim viverra semper cursus. Gravida arcu aliquet est nisl tortor urna.'),
                )
              ]),
            )),
      ),
    );
  }
}
