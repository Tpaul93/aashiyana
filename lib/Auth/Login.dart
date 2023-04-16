import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:nbhood/Dashboard/HomeScreen.dart';
import 'package:nbhood/Functions/CustomFunctions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config.dart';
import 'Register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[100],
              image: DecorationImage(
                  image: AssetImage('assets/loginn.jpeg'), fit: BoxFit.cover)),
          width: MediaQuery.of(context).size.width,
          height: 170,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 0, 50),
                child: Row(
                  children: [
                    Icon(Icons.arrow_back),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Login to enter NobrokerHood",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //     height: 70,
                  //     width: 100,
                  //     color: Colors.red,
                  //     child: Image(
                  //         image: AssetImage('assets/images/login.jpeg')))
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            cursorColor: Colors.green,
            controller: phone,
            onChanged: (v) {
              if (!isPassword) {
                isPassword = true;
              }
            },
            decoration: InputDecoration(
              hintText: "Email or Mobile Number",
            ),
          ),
        ),
        isPassword
            ? Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  cursorColor: Colors.green,
                  obscureText: true,
                  controller: password,
                  decoration: const InputDecoration(label: Text("Password")),
                ),
              )
            : SizedBox(),
        GestureDetector(
          onTap: () async {
            if (phone.text.toString().isNotEmpty &&
                password.text.toString().isNotEmpty) {
              myLoading(context);
              http.Response resp = await http.post(Uri.parse(APP_API), body: {
                "phone": phone.text.toString(),
                "password": password.text.toString(),
                "loginUser": "true"
              });
              Navigator.pop(context);
              if (resp.body.toString() != "failed") {
                List user = [];
                user = jsonDecode(resp.body);
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString("uid", user[0]['id']);
                prefs.setString("name", user[0]['name']);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeScreen(
                              uid: user[0]['id'].toString(),
                            )));
              } else {
                myAlert(context, "Login failed! Please check info...");
              }
            } else {
              myAlert(context, "Please enter a valid details!");
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: 50,
              child: Center(
                  child: Text(
                "Continue",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 72, 164, 77)),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.orange[100]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Want to register your society\nwith Dev Sec it',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Refer your society & earn Rs.99\nOver 400 people have earned',
                      style: TextStyle(fontSize: 13, color: Colors.black),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                        child: Text(
                          "Register >",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 72, 164, 77)),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150,
                  width: 150,
                  child: Image.asset('assets/register.jpeg'),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
