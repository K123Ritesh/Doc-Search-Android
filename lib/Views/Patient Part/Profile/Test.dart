import 'package:doc_search/Views/Patient%20Part/Profile/TestDeatil.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFF005473),
        appBar: AppBar(
          backgroundColor: Color(0XFF005473),
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Container(
            margin: EdgeInsets.only(left: 80),
            child: Text(
              'My Test',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  height: 116,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      Container(
                        color: const Color.fromARGB(255, 229, 233, 236),
                        width: 150,
                        height: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5)),
                          child: Image.asset(
                            'assets/Images/MedicineStore.png',
                            width: 150,
                            height: 150,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        width: 200,
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
                                    height: 16,
                                    width: 41,
                                    decoration: BoxDecoration(
                                        color: Color(0XFF005473),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset('assets/Icons/star.png',
                                            height: 10, width: 10),
                                        Text('4.5',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10))
                                      ],
                                    ))
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: 10, right: 50, bottom: 5),
                              child: Text(
                                "JDAR Pathology Lab",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                'E-13, South Extension Market, Part-II, New Delhi',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Test_Details()),
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(top: 10),
                                      decoration: BoxDecoration(
                                          color: const Color(0XFF005473),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      // height: 40,
                                      // width: 230,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 4),
                                        child: Center(
                                          child: Text(
                                            'View Document',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ));
  }
}
