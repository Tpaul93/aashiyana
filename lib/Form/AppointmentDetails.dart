import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:hello_devsecit/hello_devsecit.dart';
import 'package:images_picker/images_picker.dart';
import 'package:nbhood/Form/AppointmentVerify.dart';
import 'package:nbhood/Functions/CustomFunctions.dart';
import 'package:nbhood/exporter.dart';
import 'package:http/http.dart' as http;

class AppointmentDetails extends StatefulWidget {
  var uid, fid, type;
  AppointmentDetails(
      {super.key, required this.uid, required this.fid, required this.type});

  @override
  State<AppointmentDetails> createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails> {
  List<Media> photos = [];
  String img = '';

  Future getImage() async {
    photos = (await ImagesPicker.pick(
      count: 1,
      pickType: PickType.image,
    ))!;
    if (photos != null) {
      File fl = File.fromUri(Uri.parse(photos.first.path));
      Future<Uint8List> bdt = fl.readAsBytes();
      bdt.then((value) {
        img = base64Encode(value).toString();
        setState(() {});
        return base64Encode(value).toString();
      });
      print("IMG code " + img.toString());
      print(photos.toString());
    } else {
      print("Image is not selected ");
    }
  }

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController from = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.fid} Tower"),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      H1(text: "Enter basic details!"),
                      SizedBox(height: 10),
                      Paragraph(
                          text:
                              "This information are required to validate person")
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 80,
                  child: Image.asset("assets/img/guests.png"),
                )
              ],
            ),
          ),
          Divider(),
          SizedBox(height: 35),
          Container(
            width: MediaQuery.of(context).size.width,
            child: TextFormField(
              controller: name,
              decoration: InputDecoration(
                label: Text("Enter name"),
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: MediaQuery.of(context).size.width,
            child: TextFormField(
              controller: phone,
              decoration: InputDecoration(
                label: Text("Enter mobile no."),
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: MediaQuery.of(context).size.width,
            child: TextFormField(
              controller: from,
              decoration: InputDecoration(
                label: Text("Came from"),
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: MediaQuery.of(context).size.width,
            child: TextFormField(
              controller: address,
              decoration: InputDecoration(
                label: Text("Address"),
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: MediaQuery.of(context).size.width,
            child: TextFormField(
              controller: description,
              decoration: InputDecoration(
                label: Text("Short description"),
              ),
            ),
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: () async {
              await getImage();
            },
            child: Container(
              height: 160,
              child: img.length > 2
                  ? Image(image: MemoryImage(base64Decode(img)))
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset("assets/camera.png")),
            ),
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: () async {
              if (name.text.toString().isNotEmpty &&
                  phone.text.toString().isNotEmpty &&
                  from.text.toString().isNotEmpty &&
                  address.text.toString().isNotEmpty &&
                  description.text.toString().isNotEmpty &&
                  img.toString().isNotEmpty) {
                myLoading(context);
                http.Response re = await http.post(Uri.parse(APP_API), body: {
                  "name": name.text.toString(),
                  "phone": phone.text.toString(),
                  "from": from.text.toString(),
                  "address": address.text.toString(),
                  "description": description.text.toString(),
                  "file": img.toString(),
                  "uid": widget.uid.toString(),
                  "appointmentDetails": 'true',
                });
                Navigator.pop(context);
                print(re.body.toString());
                if (re.body.toString() == "Success") {
                  go(
                      context,
                      AppointmentVerify(
                          address: address.text.toString(),
                          fid: widget.fid,
                          name: name.text.toString(),
                          phone: phone.text.toString(),
                          type: widget.type,
                          uid: widget.uid));
                } else {
                  myAlert(context, "Please check details");
                }
              } else {
                myAlert(context, "Please fill a full details");
              }
            },
            child: primaryButton(
                Icon(
                  Icons.navigate_next_rounded,
                  color: Colors.white,
                ),
                "CONTINUE"),
          )
        ],
      ),
    );
  }
}
