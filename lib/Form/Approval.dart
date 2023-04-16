import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nbhood/Functions/CustomFunctions.dart';
import 'package:nbhood/GatePass/gate_pass.dart';


import '../config.dart';

class approvePage extends StatefulWidget {
  var uid;
  approvePage({Key? key, required this.uid}) : super(key: key);

  @override
  State<approvePage> createState() => _approvePageState();
}

class _approvePageState extends State<approvePage> {
  TextEditingController meet = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(18),
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: meet,
                decoration: InputDecoration(labelText: "Meet with"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: name,
                decoration: InputDecoration(labelText: "Name"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: phone,
                decoration: InputDecoration(labelText: "Phone Number"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: date,
                decoration: InputDecoration(labelText: "Appointment Date"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: time,
                decoration: InputDecoration(labelText: "Appointment Time"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: company,
                decoration: InputDecoration(labelText: "Company Name"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: address,
                decoration: InputDecoration(labelText: "Address"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        if (meet.text.toString().isNotEmpty &&
                            name.text.toString().isNotEmpty &&
                            phone.text.toString().isNotEmpty &&
                            date.text.toString().isNotEmpty &&
                            time.text.toString().isNotEmpty &&
                            company.text.toString().isNotEmpty &&
                            address.text.toString().isNotEmpty) {
                          myLoading(context);
                          http.Response n =
                              await http.post(Uri.parse(APP_API), body: {
                            'meetwith': meet.text.toString(),
                            'name': name.text.toString(),
                            'phone': phone.text.toString(),
                            'date': date.text.toString(),
                            'time': time.text.toString(),
                            'company': company.text.toString(),
                            'address': address.text.toString(),
                            "uid": widget.uid,
                            'sendMessage': 'true'
                          });
                          Navigator.pop(context);
                          print(n.body.toString());
                          if (n.body.toString() == 'Success') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => GatePass(uid: widget.uid)));
                          } else {
                            myAlert(context, "Please check details");
                          }
                        } else {
                          myAlert(context, "Please fill a full details");
                        }
                      },
                      child: Text("Send Message")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
