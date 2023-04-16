import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Functions/CustomFunctions.dart';
import '../Widgets/custom_order_widget.dart';
import '../config.dart';
import 'Login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  var designation, city;
  TextEditingController society = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Colors.red,
          title: const Text(
            "Register your Society",
            style: TextStyle(fontSize: 15, color: Colors.black),
          )),
      body: ListView(
        children: [
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
                    children: const [
                      Text(
                        'Want to register your society\nwith NobrokerHood',
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
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              cursorColor: Colors.green,
              controller: name,
              decoration: const InputDecoration(
                hintText: "Society Person Name *",
              ),
            ),
          ),
          Container(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: phone,
              cursorColor: Colors.green,
              decoration: const InputDecoration(
                  hintText: 'Society person contact number *'),
            ),
          ),
          CustomOrderWidget(
            title: "",
            widget: Container(
              height: 45,
              width: 375,
              child: DropdownSearch<String>(
                popupProps: PopupProps.menu(
                  showSelectedItems: true,
                  disabledItemFn: (String s) => s.startsWith('c'),
                ),
                items: const [
                  "Society MC Member ",
                  "Society Treasurer",
                  'Society Secretary',
                  'Society Chaiman',
                  'Society Vice President',
                  'Society President'
                ],
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(),
                ),
                onChanged: (v) {
                  setState(() {
                    designation = v.toString();
                  });
                },
                selectedItem: "Designation *",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              cursorColor: Colors.green,
              controller: society,
              decoration: const InputDecoration(
                hintText: "Society Name *",
              ),
            ),
          ),
          CustomOrderWidget(
            title: "",
            widget: Container(
              height: 45,
              width: 375,
              child: DropdownSearch<String>(
                popupProps: PopupProps.menu(
                  showSelectedItems: true,
                  disabledItemFn: (String s) => s.startsWith('c'),
                ),
                items: const [
                  "South Mumbai",
                  "Nagpur",
                  'Jaipur',
                  'Ahmedabad',
                  'Chennai',
                  'Kolkata',
                  'Raiganj',
                  'Malda',
                  'Siliguri',
                ],
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(),
                ),
                onChanged: (v) {
                  setState(() {
                    city = v.toString();
                  });
                },
                selectedItem: "City *",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              cursorColor: Colors.green,
              controller: email,
              decoration: const InputDecoration(
                hintText: "Enter your email *",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              cursorColor: Colors.green,
              obscureText: true,
              controller: password,
              decoration: const InputDecoration(
                hintText: "Enter your password *",
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              if (name.text.toString().isNotEmpty &&
                  password.text.toString().isNotEmpty &&
                  society.text.toString().isNotEmpty &&
                  email.text.toString().isNotEmpty &&
                  password.text.toString().isNotEmpty) {
                myLoading(context);
                http.Response v = await http.post(Uri.parse(APP_API), body: {
                  'name': name.text.toString(),
                  'phone': phone.text.toString(),
                  'designation': designation.toString(),
                  'society': society.text.toString(),
                  'city': city.toString(),
                  'email': email.text.toString(),
                  'password': password.text.toString(),
                  'registerUser': 'true'
                });
                Navigator.pop(context);
                if (v.body.toString() == "Success") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                } else {
                  myAlert(context, "Please enter a valid details!");
                }
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 50,
                child: Center(
                    child: Text(
                  "Register Now",
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
        ],
      ),
    );
  }
}
