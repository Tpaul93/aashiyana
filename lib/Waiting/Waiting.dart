import 'package:flutter/material.dart';
import 'package:hello_devsecit/hello_devsecit.dart';
import 'package:nbhood/Widgets/bottomNavBar.dart';

import '../exporter.dart';

class WaitingForApproval extends StatefulWidget {
  var uid;
  WaitingForApproval({super.key, required this.uid});

  @override
  State<WaitingForApproval> createState() => _WaitingForApprovalState();
}

class _WaitingForApprovalState extends State<WaitingForApproval> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Waiting for approval"),
        ),
        body: ListView(
          children: [
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
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 18,
                          child: secondaryButton(
                              Icon(
                                Icons.remove_shopping_cart_rounded,
                                color: Colors.red,
                              ),
                              "NOT COLLECTED"),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 18,
                          child: secondaryButton(
                              Icon(
                                Icons.shopping_basket_rounded,
                                color: Colors.green,
                              ),
                              " COLLECTED"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
        bottomNavigationBar: bottomNavBar(context, widget.uid, 1));
  }
}
