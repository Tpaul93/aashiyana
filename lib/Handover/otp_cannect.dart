import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:hello_devsecit/hello_devsecit.dart';
import 'package:nbhood/Handover/resident_name.dart';
import 'package:nbhood/Widgets/Button.dart';

class OtpCannect extends StatefulWidget {
  var uiu;
  OtpCannect({super.key, required this.uiu});

  @override
  State<OtpCannect> createState() => _OtpCannectState();
}

class _OtpCannectState extends State<OtpCannect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verify"),
      ),
      body: ListView(
        children: [
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Enter OTP",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Enter OTP provided by resident"),
          ),
          Container(
            height: 70,
            width: MediaQuery.of(context).size.width,
            child: OtpTextField(
              numberOfFields: 6,
              onSubmit: (v) {},
            ),
          ),
          SizedBox(
            height: 70,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ResidentName(
                            uid: widget,
                          )));
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 50,
                child: Center(
                    child: Text(
                  "CONTINUE",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 72, 164, 77)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: 50,
              child: Center(
                  child: Text(
                "HandOver without OTP ",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 230, 247, 231)),
            ),
          ),
        ],
      ),
    );
  }
}
