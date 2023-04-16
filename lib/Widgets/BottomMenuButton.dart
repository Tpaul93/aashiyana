import 'package:flutter/material.dart';
import 'package:hello_devsecit/hello_devsecit.dart';
import 'package:nbhood/config.dart';

bottomMenuButton(context, page, icon, title, isSelected) {
  return GestureDetector(
    onTap: () {
      go(context, page);
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: isSelected ? APP_COLOR : APP_BTN_COLOR,
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(color: isSelected ? APP_COLOR : APP_BTN_COLOR),
        )
      ],
    ),
  );
}
