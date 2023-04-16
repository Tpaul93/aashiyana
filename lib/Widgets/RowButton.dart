import 'package:flutter/material.dart';
import 'package:hello_devsecit/hello_devsecit.dart';
import 'package:nbhood/Handover/handover.dart';
import 'package:nbhood/exporter.dart';

rowButton(context, image, title) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => Handover(uid: Widget)));
    },
    child: Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 4,
            child: Image.asset(
              image,
            ),
          ),
          H3(text: title)
        ],
      ),
    ),
  );
}
