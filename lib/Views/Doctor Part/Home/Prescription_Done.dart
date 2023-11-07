import 'package:doc_search/Config/sizeConfig.dart';
import 'package:doc_search/Views/Doctor%20Part/Home/Home_Page.dart';
import 'package:flutter/material.dart';

class Prescription_Done extends StatefulWidget {
  const Prescription_Done({super.key});

  @override
  State<Prescription_Done> createState() =>
      _Prescription_DoneState();
}

class _Prescription_DoneState extends State<Prescription_Done> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: const Color(0xFF1B6A85),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B6A85),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
            margin: const EdgeInsets.only(left: 60),
            child: const Text(
              'Appointments',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            )),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20.fw, right: 20.fw, bottom: 20.fh),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 250,),
              Text('DONE!',style: TextStyle(fontSize: 32,color: Colors.white,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Text('The Prescription was successfully uploaded.',style: TextStyle(fontSize: 16,color: Colors.white),),
              SizedBox(height: 20,),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Doctor_Home_Page()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0XFF005473),
                      borderRadius: BorderRadius.circular(10)),
                  height: 36,
                  width: 56,
                  child: Center(
                    child: Text(
                      'Done',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
