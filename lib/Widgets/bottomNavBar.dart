import 'package:flutter/material.dart';

import '../exporter.dart';

bottomNavBar(context, uid, selected) {
  return Container(
    height: 70,
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        bottomMenuButton(context, HomeScreen(uid: uid), Icons.home, "Home",
            selected == 0 ? true : false),
        bottomMenuButton(
            context,
            WaitingForApproval(uid: uid),
            Icons.watch_later_outlined,
            "Waiting",
            selected == 1 ? true : false),
        bottomMenuButton(context, HomeScreen(uid: uid), Icons.logout, "Exit",
            selected == 2 ? true : false),
        bottomMenuButton(context, HomeScreen(uid: uid), Icons.more_horiz,
            "More", selected == 3 ? true : false),
      ],
    ),
  );
}
