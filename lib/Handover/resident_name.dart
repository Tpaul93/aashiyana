import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:nbhood/Widgets/bottomNavBar.dart';
import 'package:nbhood/exporter.dart';

class ResidentName extends StatefulWidget {
  var uid;
  ResidentName({super.key, required this.uid});

  @override
  State<ResidentName> createState() => _ResidentNameState();
}

class _ResidentNameState extends State<ResidentName> {
  var selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Resident name")),
        body: ListView(
          children: [
            ListTile(
                leading: Icon(Icons.person_outline_outlined),
                title: Text("Rahul Roy"),
                trailing: Icon(selected == 0
                    ? Icons.radio_button_checked_outlined
                    : Icons.radio_button_off_outlined)),
            Divider(),
            ListTile(
                leading: Icon(Icons.person_outline_outlined),
                title: Text("Rahul Roy"),
                trailing: Icon(selected == 0
                    ? Icons.radio_button_checked_outlined
                    : Icons.radio_button_off_outlined)),
            Divider(),
            ListTile(
                leading: Icon(Icons.person_outline_outlined),
                title: Text("Rahul Roy"),
                trailing: Icon(selected == 0
                    ? Icons.radio_button_checked_outlined
                    : Icons.radio_button_off_outlined)),
            Divider(),
            ListTile(
                leading: Icon(Icons.person_outline_outlined),
                title: Text("Rahul Roy"),
                trailing: Icon(selected == 0
                    ? Icons.radio_button_checked_outlined
                    : Icons.radio_button_off_outlined)),
            Divider(),
            SizedBox(
              height: 30,
            ),
            Padding(
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
          ],
        ),
        bottomNavigationBar: bottomNavBar(context, widget.uid, 1));
  }
}
