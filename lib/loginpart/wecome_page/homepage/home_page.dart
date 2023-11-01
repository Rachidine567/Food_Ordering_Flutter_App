import 'package:best_food_project/loginpart/login.dart';
import 'package:best_food_project/loginpart/wecome_page/homepage/categorycard.dart';
import 'package:best_food_project/loginpart/wecome_page/homepage/data.dart';
// import 'package:best_food_project/loginpart/wecome_page/homepage/data.dart';
// import 'package:best_food_project/loginpart/wecome_page/homepage/data.dart';
import 'package:best_food_project/loginpart/wecome_page/homepage/item_screen_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//class HomePage extends StatelessWidget {

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String deliveryLocation = "Moroni, Comoros"; // Default location

  List<Map<String, dynamic>> searchResult = [];

  // Function to change the delivery location
  void changeLocation() {
    // You can add logic here to change the delivery location dynamically
    setState(() {
      deliveryLocation = "New Location"; // Replace with your logic
    });
  }

  void searchFromFirebase(String query) async {
    // Retrieve data from Firestore
    final result = await _firestore
        .collection('food')
        .where('name', isEqualTo: query)
        .get();

    setState(() {
      // Update your widget's state with the retrieved data
      searchResult = result.docs.map((e) => e.data()).toList();
    });
  }

  Future<void> addDataToFirestore() async {
    await _firestore.collection('food').add({
      'name': 'salad',
      'name': 'chicken',
      'foods': 'pilaf',
      'price': 20,
      // Add more fields as needed
    });
  }

  // List searchResult = [];

  // void searchFromFirebase(String query) async {
  //   final result = await FirebaseFirestore.instance
  //       .collection('search')
  //       .where('name', isEqualTo: query)
  //       .get();

  //   setState(() {
  //     searchResult = result.docs.map((e) => e.data()).toList();
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // Initialize Firestore here
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_outlined),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Logout"),
                      content: const Text("Are you sure,you want to Logout?"),
                      actionsAlignment: MainAxisAlignment.center,
                      actions: [
                        ElevatedButton(
                          onPressed: () async {
                            FirebaseAuth.instance.signOut();
                            Navigator.pop(context);
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.remove('rememberMe');
                            navigateToLogin();
                          },
                          child: const Text("Confirm"),
                        ),
                        const Padding(padding: EdgeInsets.all(5.0)),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancel")),
                      ],
                    );
                  });
            },
          )
        ],
      ),
      body: Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Deliver to",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 5),
                        InkWell(
                          onTap:
                              changeLocation, // Tap gesture to trigger the change
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Color(0xFFFF2F08),
                              ),
                              Text(
                                deliveryLocation,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              // Row(
                              //   children: [
                              //     Icon(
                              //       Icons.location_on,
                              //       color: Color(0xFFFF2F08),
                              //     ),
                              //     Text(
                              //       "Moroni, Comoros",
                              //       style: TextStyle(
                              //         fontSize: 20,
                              //         fontWeight: FontWeight.bold,
                              //       ),
                              //     ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Color(0xFFFF2F08),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          margin: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage("images/profile.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                            left: 40,
                            child: Container(
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 3),
                                color: Color(0xFFFF2F08),
                                shape: BoxShape.circle,
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.4,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Color(0xFFFF3F3f3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Search your food here....",
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search),
                        ),
                        // onChanged: (query) {
                        //   searchFromFirebase(query);
                        // },
                      ),
                    ),
                  ),
                  // Expanded(
                  //   child: ListView.builder(
                  //     itemCount: searchResult.length,
                  //     itemBuilder: (context, index) {
                  //       return ListTile(
                  //         title: Text(searchResult[index]['name']),
                  //         subtitle: Text(searchResult[index]['price']),
                  //       );
                  //     },
                  //   ),
                  // ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Color(0xFFFF2F08),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.filter_list,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset("images/dishes.jpg"),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "See all",
                        style: TextStyle(
                          color: Color(0xFFFF2F08),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: Data.foods.length,
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      bgColor: Data.bgColors[index],
                      food: Data.foods[index],
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "See All",
                        style: TextStyle(
                          color: Color(0xFFFF2F08),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 221,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: Data.foods2.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ItemScreenPage(),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.4,
                        margin: EdgeInsets.only(
                            left: 15, top: 5, bottom: 5, right: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              child: Image.asset(
                                "images/${Data.foods2[index]}.jpg",
                                height: 120,
                                width: MediaQuery.of(context).size.width / 1.4,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Data.foods2[index],
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "Fast Food",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black45),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Color(0xFFFFF2F08),
                                            size: 20,
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            "4.7",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            "(1000 Ratings)",
                                            style: TextStyle(
                                              color: Colors.black45,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              color: Color(0xFFFF2F08),
                                              size: 20,
                                            ),
                                            SizedBox(width: 2),
                                            Text(
                                              "1 KM",
                                              style: TextStyle(
                                                color: Colors.black45,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        padding: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFF2F08),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                          ),
                                        ),
                                        child: Text(
                                          "\$15.18",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }

  void navigateToLogin() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return LoginPage();
    }));
  }
}
