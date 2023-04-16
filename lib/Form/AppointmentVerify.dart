import 'package:flutter/material.dart';
import 'package:hello_devsecit/hello_devsecit.dart';
import 'package:nbhood/config.dart';
import 'package:nbhood/exporter.dart';

class AppointmentVerify extends StatefulWidget {
  var uid, name, phone, address, type, fid;
  AppointmentVerify({
    super.key,
    required this.address,
    required this.fid,
    required this.name,
    required this.phone,
    required this.type,
    required this.uid,
  });

  @override
  State<AppointmentVerify> createState() => _AppointmentVerifyState();
}

class _AppointmentVerifyState extends State<AppointmentVerify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check details"),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  width: 80,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset("assets/img/delivery.jpg")),
                ),
                SizedBox(width: 10),
                Container(
                  width: MediaQuery.of(context).size.width - 80 - 10 - 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name : ${widget.name}"),
                      SizedBox(height: 10),
                      Text("Phone : ${widget.phone}"),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 3, bottom: 3),
                        child: Text(
                          widget.type,
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 108, 165, 211),
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      SizedBox(height: 10),
                      // Text("Came from : ${widget.from}"),
                      Text("Address : ${widget.address}"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          SizedBox(height: 15),
          Paragraph(text: "VEHICLE DETAILS"),
          SizedBox(height: 15),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text("No Vehicle"),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: APP_BTN_COLOR),
                      borderRadius: BorderRadius.circular(4)),
                ),
                SizedBox(width: 15),
                Container(
                  alignment: Alignment.center,
                  child: Text("2 Wheeler"),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: APP_BTN_COLOR),
                      borderRadius: BorderRadius.circular(4)),
                ),
                SizedBox(width: 15),
                Container(
                  alignment: Alignment.center,
                  child: Text("4 Wheeler"),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: APP_BTN_COLOR),
                      borderRadius: BorderRadius.circular(4)),
                )
              ],
            ),
          ),
          SizedBox(height: 45),
          GestureDetector(
            onTap: () => go(context, WaitingForApproval(uid: widget.uid)),
            child: primaryButton(
                Icon(
                  Icons.notifications_active,
                  color: Colors.white,
                ),
                "ASK RESIDENT APPROVAL"),
          )
        ],
      ),
    );
  }
}
