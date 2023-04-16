import 'package:flutter/material.dart';
import 'package:nbhood/exporter.dart';

primaryButton(Icon icon, title) {
  return Container(
    height: 50,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.green,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        SizedBox(width: 10),
        Text(title, style: TextStyle(color: Colors.white, fontSize: 19))
      ],
    ),
  );
}

secondaryButton(Icon icon, title) {
  return Container(
    height: 40,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        // color: Colors.green,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: APP_BTN_COLOR)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        SizedBox(width: 10),
        Text(title, style: TextStyle(color: APP_BTN_COLOR, fontSize: 14))
      ],
    ),
  );
}
