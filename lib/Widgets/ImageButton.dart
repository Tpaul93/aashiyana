import 'package:flutter/material.dart';

imageButton(image, title) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Image.asset(
              image,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(title),
      ],
    ),
  );
}
