import 'package:flutter/material.dart';
import 'package:nbhood/Auth/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'exporter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var uid;
  getUID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      uid = prefs.getString("uid");
    } catch (e) {}
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getUID();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_NAME,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 82, 82, 82),
        ),
        appBarTheme: const AppBarTheme(
            elevation: 1,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black),
      ),
      home: uid != null ? HomeScreen(uid: 1) : LoginScreen(),
    );
  }
}
