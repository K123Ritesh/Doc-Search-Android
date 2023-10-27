import 'package:flutter/material.dart';

class Appointments_Page extends StatefulWidget {
  const Appointments_Page({super.key});

  @override
  State<Appointments_Page> createState() => _Appointments_PageState();
}

class _Appointments_PageState extends State<Appointments_Page> {
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
                      width: 100,
                    ),
                    Text(
                      'Appointments',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Image.network(
                  "https://s3-alpha-sig.figma.com/img/cfd8/35bd/05a979e390cb6b79b4669331c59b7c23?Expires=1699228800&Signature=DUSCUbtdphkTq0dIB6RN3j-aorZVB1KuL2Eqx9h~3p3NuVw7bxYrYZ7h04eLQeqJ40wEGTERYhkCbYRodNu3kOgIMVUmbfkYPxTVePM7~86xNUkmbDmeq8OtcXFzTdVBO-bMnzg~4~Tm1SolP8h0Q3eqcjGieFJtGUw79dYP0na~MkvYkiqm~JFTeQjiU5W4YltFK-jSMNhMKvBLRtHU8PKKEHUtvfbWlvI6BNQ3DKcoPkNgaLXZTNiNlwyDCkRiLBQQIgt69cpwc3GEDsyu5n7~kiSzvjjGHRI8DBJCShWf~EVEj9yflzzkdzVHHlyzKeI7P8Rh34fQkdpq9-LxUQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                  height: 298,
                  width: 298,
                ),
                Text(
                  "You haven’t booked any appointments yet",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Start by looking for doctors near you",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      height: 40,
                      width: 230,
                      child: Center(
                        child: Text(
                          'Book Now',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    )
                  ],
                )
              ]),
            )),
      ),
    );
  }
}
