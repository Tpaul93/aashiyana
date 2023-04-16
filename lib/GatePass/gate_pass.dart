import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nbhood/pages/home_page.dart';


import '../Form/Approval.dart';
import '../config.dart';

class GatePass extends StatefulWidget {
  var uid;
  GatePass({Key? key, required this.uid}) : super(key: key);

  @override
  State<GatePass> createState() => _GatePassState();
}

class _GatePassState extends State<GatePass> {
  List visitors = [];
  bool isLoading = true;

  getVisitors() async {
    http.Response resp = await http.post(Uri.parse(APP_API),
        body: {"uid": widget.uid, "getVisitors": "true"});
    try {
      visitors = jsonDecode(resp.body.toString());
    } catch (e) {}
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getVisitors();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => HomePage(uid: widget.uid)));
        return false;
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => InviteVisitor(
                          uid: widget.uid,
                        )));
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.red,
        ),
        appBar: AppBar(
          title: Text("Visitors"),
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : visitors.length < 1
                ? Center(
                    child: Text(
                      "You can issue Gate Pass for current visitors only",
                      style: TextStyle(fontSize: 14),
                    ),
                  )
                : ListView.builder(
                    itemCount: visitors.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        height: 120,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 226, 226, 226),
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Meet with ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(visitors[index]['meet_with'].toString())
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Visitor Name ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(visitors[index]['name'].toString())
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Phone ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(visitors[index]['phone'].toString())
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Appointment ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(visitors[index]['date'].toString() +
                                    " - " +
                                    visitors[index]['time'].toString())
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Address ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(visitors[index]['address'].toString())
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}

class InviteVisitor extends StatefulWidget {
  var uid;
  InviteVisitor({Key? key, required this.uid}) : super(key: key);

  @override
  State<InviteVisitor> createState() => _InviteVisitorState();
}

class _InviteVisitorState extends State<InviteVisitor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Notify Gate"),
        ),
        body: ListView(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => approvePage(uid: widget.uid)));
              },
              child: ListTile(
                leading: Icon(Icons.car_crash_outlined),
                title: Text(
                  "Cab",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Pre-approve expected cab entry"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => approvePage(uid: widget.uid)));
              },
              child: ListTile(
                leading: Icon(Icons.directions_bike_sharp),
                title: Text(
                  "Delivery",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Pre-approve expected cab entry"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => approvePage(uid: widget.uid)));
              },
              child: ListTile(
                leading: Icon(Icons.supervisor_account_outlined),
                title: Text(
                  "Guest",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Pre-approve expected cab entry"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => approvePage(uid: widget.uid)));
              },
              child: ListTile(
                leading: Icon(Icons.multiple_stop_outlined),
                title: Text(
                  "Others",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Pre-approve expected cab entry"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            )
          ],
        ));
  }
}
