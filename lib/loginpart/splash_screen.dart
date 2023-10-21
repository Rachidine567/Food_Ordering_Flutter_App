import 'dart:async';
import 'package:best_food_project/loginpart/login.dart';
import 'package:best_food_project/loginpart/wecome_page/homepage/home_page.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

bool finalValue = false;

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    getRememberMePreference().whenComplete(() async {
      Timer(const Duration(seconds: 3), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return finalValue == false ? const LoginPage() : HomeScreen();
        }));
      });
    });
  }

  // To retrieve the "Remember Me" preference
  Future getRememberMePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var obtainedValue = prefs.getBool('rememberMe');
    setState(() {
      finalValue = obtainedValue!;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;

    return Scaffold(
        body: Center(
      child: Text("Food Recipe"),
    ));
  }
}
