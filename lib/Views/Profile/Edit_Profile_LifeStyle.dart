import 'package:flutter/material.dart';

class EditProfileLifestyle extends StatefulWidget {
  const EditProfileLifestyle({super.key});

  @override
  State<EditProfileLifestyle> createState() => _EditProfileLifestyleState();
}

class _EditProfileLifestyleState extends State<EditProfileLifestyle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/backgroundimage.png'),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Column(
              children: [
                Center(
                    child: Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              height: 40,
              child: Card(
                color: Colors.blueGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Presonal',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        )),
                    SizedBox(
                      width: 32,
                    ),
                    Text(
                      'Medical',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    SizedBox(
                      width: 32,
                    ),
                    Text(
                      'Lifestyle',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    height: 70,
                    child: Card(
                      child: Row(
                        children: [
                          Text(
                            '  Smoking Habit',
                            style: TextStyle(fontSize: 22, color: Colors.grey),
                          ),
                          Spacer(),
                          Text(
                            'add   ',
                            style: TextStyle(color: Colors.blue, fontSize: 22),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 70,
                    child: Card(
                      child: Row(
                        children: [
                          Text(
                            '  Alcohol Consumption',
                            style: TextStyle(fontSize: 22, color: Colors.grey),
                          ),
                          Spacer(),
                          Text(
                            'add   ',
                            style: TextStyle(color: Colors.blue, fontSize: 22),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 70,
                    child: Card(
                      child: Row(
                        children: [
                          Text(
                            '  Activity Level',
                            style: TextStyle(fontSize: 22, color: Colors.grey),
                          ),
                          Spacer(),
                          Text(
                            'add   ',
                            style: TextStyle(color: Colors.blue, fontSize: 22),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 70,
                    child: Card(
                      child: Row(
                        children: [
                          Text(
                            '  Food Prefrence',
                            style: TextStyle(fontSize: 22, color: Colors.grey),
                          ),
                          Spacer(),
                          Text(
                            'add   ',
                            style: TextStyle(color: Colors.blue, fontSize: 22),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 70,
                    child: Card(
                      child: Row(
                        children: [
                          Text(
                            '  Occuption',
                            style: TextStyle(fontSize: 22, color: Colors.grey),
                          ),
                          Spacer(),
                          Text(
                            'add   ',
                            style: TextStyle(color: Colors.blue, fontSize: 22),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
