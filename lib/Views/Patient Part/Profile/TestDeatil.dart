import 'package:flutter/material.dart';

class Test_Details extends StatefulWidget {
  const Test_Details({super.key});

  @override
  State<Test_Details> createState() => _Test_DetailsState();
}

class _Test_DetailsState extends State<Test_Details> {
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
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Patient Name : Ankita Gupta',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
            SizedBox(height: 5,),
            Text(
              'Ref. By : Dr. Shiddharta Verma',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
            SizedBox(height: 5,),
            Text(
              'Lab Name : JDAR Pathology Lab',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                  'Complete Blood Count.pdf',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                Icon(Icons.check_circle,color: Colors.green,)
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        color: const Color(0XFF1B6A85),
                        borderRadius: BorderRadius.circular(10)),
                    height: 36,
                    width: 80,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                      child: Center(
                        child: Text(
                          'Download',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                  'Complete Blood Count.pdf',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                Icon(Icons.check_circle,color: Colors.green,)
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        color: const Color(0XFF1B6A85),
                        borderRadius: BorderRadius.circular(10)),
                    height: 36,
                    width: 80,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                      child: Center(
                        child: Text(
                          'Download',
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
            )
          ],
        ),
      ),
    );
  }
}
