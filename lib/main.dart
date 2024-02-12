import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_screen/Pages/home.dart';
import 'package:login_screen/Pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => SplashScreenPage();
}

class SplashScreenPage extends State<SplashScreen> {
  static const String LOGINKEY = "LogIn";

  @override
  void initState() {
    super.initState();

    whereToGo();

    // Timer(Duration(seconds: 2), () {
    //   Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => LogInScreen(),
    //       ));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.purple.shade100,
      child: Center(
        child: Container(
          width: 70,
          height: 70,
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.person,
              size: 40,
            ),
          ),
        ),
      ),
    ));
  }

  void whereToGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(LOGINKEY);
    Timer(Duration(seconds: 2), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LogInScreen(),
              ));
        }
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LogInScreen(),
            ));
      }
    });
  }
}
