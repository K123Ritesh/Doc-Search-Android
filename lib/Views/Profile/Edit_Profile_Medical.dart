import 'package:flutter/material.dart';

class EditProfileMedical extends StatefulWidget {
  const EditProfileMedical({super.key});

  @override
  State<EditProfileMedical> createState() => _EditProfileMedicalState();
}

class _EditProfileMedicalState extends State<EditProfileMedical> {
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
                            '  Allergies',
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
                            '  Current Medications',
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
                            '  Past Medications',
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
                            '  Chronic Diseases',
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
                            '  Injuries',
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
                            '  Surgeries',
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
