import 'package:flutter/material.dart';
import 'package:hello_devsecit/hello_devsecit.dart';
import 'package:nbhood/exporter.dart';

class SelectFlat extends StatefulWidget {
  var uid, type;
  SelectFlat({super.key, required this.uid, required this.type});

  @override
  State<SelectFlat> createState() => _SelectFlatState();
}

class _SelectFlatState extends State<SelectFlat> {
  bool isSearch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(top: 10),
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width,
          height: 70,
          child: const TextField(
            decoration: InputDecoration(
                hintText: "Select flat/floor",
                suffixIcon: Icon(Icons.search),
                border: InputBorder.none),
          ),
        ),
      ),
      body: GridView.builder(
          itemCount: 40,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 7 / 3),
          itemBuilder: (_, i) => GestureDetector(
                onTap: () => go(
                    context,
                    AppointmentDetails(
                      uid: widget.uid,
                      fid: i,
                      type: widget.type,
                    )),
                child: Container(
                  height: 80,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 238, 238, 238),
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(Icons.business_outlined),
                      SizedBox(width: 10),
                      Text("$i Tower"),
                    ],
                  ),
                ),
              )),
    );
  }
}
