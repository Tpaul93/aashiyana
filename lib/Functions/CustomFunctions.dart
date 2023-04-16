import 'package:flutter/material.dart';

myAlert(context, text) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            content: Text(text),
          ));
}

myLoading(context) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            content: Container(
              height: 45,
              child: Row(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Please wait...")
                ],
              ),
            ),
          ));
}
