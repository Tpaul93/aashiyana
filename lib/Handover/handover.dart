import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hello_devsecit/Sdk/Paragraph.dart';
import 'package:nbhood/Handover/otp_cannect.dart';
import 'package:nbhood/Widgets/Button.dart';
import 'package:nbhood/Widgets/bottomNavBar.dart';

class Handover extends StatefulWidget {
  var uid;
  Handover({super.key, required this.uid});

  @override
  State<Handover> createState() => _HandoverState();
}

class _HandoverState extends State<Handover> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Delivery Handover"),
        ),
        body: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey[300],
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          child: Icon(Icons.home_work_outlined),
                          backgroundColor: Colors.grey[200],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("O TOWER",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.black)),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("CANNECT AT GATE",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.green)),
                          )
                        ],
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   crossAxisAlignment: CrossAxisAlignment.end,
                      //   children: [
                      //     Container(
                      //       child: Text("1",
                      //           style: TextStyle(
                      //               fontSize: 17, color: Colors.black)),
                      //     ),
                      //     Text("Parcel",
                      //         style:
                      //             TextStyle(fontSize: 12, color: Colors.green))
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ],
            ),
            for (var x = 0; x <= 10; x++)
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 10),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 80,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset("assets/img/delivery.jpg")),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width:
                              MediaQuery.of(context).size.width - 80 - 10 - 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Name : Test Name"),
                              SizedBox(height: 5),
                              Text("Phone : 28092830"),
                              SizedBox(height: 5),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 3, bottom: 3),
                                child: Text(
                                  "Delivery",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 108, 165, 211),
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                              SizedBox(height: 5),
                              // Text("Came from : ${widget.from}"),
                              Text("Address : Kolkata, Wets Bengal"),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Paragraph(
                        text: "Contact resident via intercom and get approval"),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => OtpCannect(
                                      uiu: widget,
                                    )));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: secondaryButton(
                              Icon(
                                Icons.clean_hands_outlined,
                                color: Colors.green,
                              ),
                              "Hand Over",
                            ),
                          ),
                          // SizedBox(width: 10),
                          // Container(
                          //   width: MediaQuery.of(context).size.width / 2 - 18,
                          //   child: secondaryButton(
                          //       Icon(
                          //         Icons.shopping_basket_rounded,
                          //         color: Colors.green,
                          //       ),
                          //       " Not Required COLLECTED"),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
        bottomNavigationBar: bottomNavBar(context, widget.uid, 1));
  }
}
