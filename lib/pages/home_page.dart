import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../Auth/Login.dart';
import '../GatePass/gate_pass.dart';

class HomePage extends StatefulWidget {
  var uid;
  HomePage({Key? key, required this.uid}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  bool isOpen = false;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Container(
        width: MediaQuery.of(context).size.width - 50,
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Hello "),
              accountEmail: Text("info@devsecit.com"),
              currentAccountPicture: CircleAvatar(),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => GatePass(uid: widget.uid)));
              },
              child: ListTile(
                leading: Icon(Icons.badge_outlined),
                title: Text('Gate Update'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.apartment),
              title: Text('Society Index'),
            ),
            ListTile(
              leading: Icon(Icons.cleaning_services_outlined),
              title: Text('Home Services'),
            ),
            ListTile(
              leading: Icon(Icons.home_repair_service_outlined),
              title: Text('Market Place'),
            ),
            ListTile(
              leading: Icon(Icons.person_add_alt),
              title: Text('My Profile'),
            ),
            ListTile(
              leading: Icon(Icons.explore_rounded),
              title: Text('Exprore'),
            ),
            ListTile(
              leading: Icon(Icons.logout_outlined),
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove("uid");
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => LoginScreen()));
              },
              title: Text('Log Out'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        actions: [Icon(Icons.person)],
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.white),
        height: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.hub_rounded),
                      ),
                      Text("My Hood")
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.history_edu_rounded),
                      ),
                      Text("Forum")
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.dashboard_outlined),
                      ),
                      Text("Menu")
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.handyman_outlined),
                      ),
                      Text("Services")
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.home_work_outlined),
                      ),
                      Text("Home")
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.grey[300],
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Column(
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.holiday_village_outlined),
                        ),
                        Text("Gate updates")
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.blinds_outlined),
                        ),
                        Text("My Bills")
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.maps_home_work_rounded),
                        ),
                        Text("My Society")
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.explore_outlined),
                        ),
                        Text("Explore")
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.home),
                        ),
                        Text("Home")
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 160,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      height: 125,
                      width: 250,
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage("assets/clean.jpg"),
                            fit: BoxFit.cover),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.green),
                                height: 25,
                                width: 80,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Daily Help',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                height: 25,
                                width: 70,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Visitors',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 120,
                                  child: Text(
                                    "Get daily update by adding your house help here.",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.grey[100]),
                                height: 30,
                                width: 100,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "+ Add daily help",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 125,
                      width: 250,
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(
                                "assets/acservice.jpg",
                              ),
                              fit: BoxFit.cover)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Is your AC summer ready",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Schedule a servicing today\nstarting at just Rs.199!',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(7)),
                                  height: 25,
                                  width: 70,
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Book Now",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ))),
                            )
                          ]),
                    ),
                    Container(
                      height: 125,
                      width: 250,
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "My Current Bookings",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey[300],
                              ),
                              height: 80,
                              width: 300,
                              child: ListTile(
                                leading: Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.amber[400],
                                ),
                                title: Text(
                                  'No Bookings',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  'Browse and book amennities',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 9,
                                  ),
                                ),
                                trailing: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Book",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 125,
                      width: 250,
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage('assets/ac.webp'),
                              fit: BoxFit.cover)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "Society Corner",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  child: Icon(Icons.notifications_none_sharp),
                                ),
                                Text("Notices")
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  child: Icon(Icons.headset_mic_outlined),
                                ),
                                Text("Help")
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  child: Icon(Icons.local_taxi_outlined),
                                ),
                                Text("Taxi")
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  child: Icon(Icons.houseboat),
                                ),
                                Text("Market")
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    isOpen
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            child: Icon(Icons.man_sharp),
                                          ),
                                          Text("Amenities")
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            child: Icon(
                                                Icons.cleaning_services_sharp),
                                          ),
                                          Text("Services")
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            child: Icon(Icons.book),
                                          ),
                                          Text("Directory")
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            child: Icon(
                                                Icons.shopping_cart_checkout),
                                          ),
                                          Text("Store")
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                // Container(
                                //   child: Column(
                                //     children: [
                                //       CircleAvatar(
                                //         child: Icon(Icons.soup_kitchen_outlined),
                                //       ),
                                //       Text("Home\Chef")
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          )
                        : SizedBox(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey[100]),
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                isOpen = !isOpen;
                              });
                            },
                            child: Text(isOpen ? "Less" : "See all")),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Discover on Devsecit Pvt",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 160,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 3,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          scrollDirection: Axis.horizontal,
                        ),
                        items: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: AssetImage('assets/ads.jpg'),
                                        fit: BoxFit.cover)),
                                height: 222,
                                width: 140,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: AssetImage('assets/ads1.jpg'),
                                        fit: BoxFit.cover)),
                                height: 222,
                                width: 140,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 222,
                                width: 140,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: AssetImage("assets/ads2.jpg"),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: AssetImage("assets/ads3.jpg"),
                                        fit: BoxFit.cover)),
                                height: 222,
                                width: 140,
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.grey[200],
                width: MediaQuery.of(context).size.width,
                height: 320,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Homes",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                        image:
                                            AssetImage('assets/property2.png'),
                                        fit: BoxFit.cover)),
                                height: 210,
                                width: 150,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                        image:
                                            AssetImage('assets/property.jpg'),
                                        fit: BoxFit.cover)),
                                height: 100,
                                width: 150,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                        image:
                                            AssetImage('assets/property1.jpg'),
                                        fit: BoxFit.cover)),
                                height: 100,
                                width: 150,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(134, 81, 33, 0.118),
                          borderRadius: BorderRadius.circular(12)),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Need help in listing your\nproperty? Give a missed call now!",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                            TextButton(
                                onPressed: () {}, child: Text("8765432109"))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: Container(
                  color: Colors.grey[100],
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage('assets/intro1.jpg'),
                          fit: BoxFit.cover,
                        ),
                        color: Colors.grey),
                  ),
                ),
              ),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   child: Row(children: [
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Text(
              //           "Home Services",
              //           style: TextStyle(
              //             fontSize: 15,
              //             color: Colors.black,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //         Text(
              //           "See all",
              //           style: TextStyle(
              //             fontSize: 10,
              //             color: Colors.green,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //       ],
              //     )
              //   ]),
              // )
            ]),
          ),
        ],
      ),
    );
  }
}
