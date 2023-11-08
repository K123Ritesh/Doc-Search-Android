import 'package:flutter/material.dart';

class Download_Records extends StatefulWidget {
  const Download_Records({super.key});

  @override
  State<Download_Records> createState() => _Download_RecordsState();
}

class _Download_RecordsState extends State<Download_Records> {
  @override
  Widget build(BuildContext context) {
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
              'Medical Records',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            )),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50,left: 20,right: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Text("Medicine_prescription1.pdf",style: TextStyle(fontSize: 18,color: Colors.white),),
              SizedBox(width: 5,),
              Icon(Icons.check_circle,color: Colors.green,size: 20,)
            ],
          ),
          SizedBox(height: 30,),
        Row(
            children: [
              Text("Medicine_prescription2.pdf",style: TextStyle(fontSize: 18,color: Colors.white),),
              SizedBox(width: 5,),
              Icon(Icons.check_circle,color: Colors.green,size: 20,)
            ],
          ),
          SizedBox(height: 30,),
          Center(
            child: InkWell(
              onTap: () {
                
              },
              child: Container(
                height: 48,
                width: 294,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0XFF005473)
                ),
                child: Center(child: Text('Download')),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
