import 'package:flutter/material.dart';
import 'package:login_screen/Pages/home.dart';
import 'package:login_screen/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LogInScreen();
}

class _LogInScreen extends State<LogInScreen> {
  var emailText = TextEditingController();
  var passwordText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("LogIn Screen")),
        backgroundColor: Colors.purple.shade900,
      ),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.person),
              ),
              SizedBox(
                height: 11,
              ),
              TextField(
                controller: emailText,
                decoration: InputDecoration(
                  labelText: "Email...",
                  prefixIcon: Icon(Icons.email),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.green.shade900),
                  ),
                ),
              ),
              SizedBox(
                height: 11,
              ),
              TextField(
                controller: passwordText,
                decoration: InputDecoration(
                  labelText: "Password...",
                  prefixIcon: Icon(Icons.password),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.green.shade900),
                  ),
                ),
              ),
              SizedBox(
                height: 11,
              ),
              ElevatedButton(
                  onPressed: () async {
//if successfully logged in (creds are Correct)
                    var sharedPref = await SharedPreferences.getInstance();
                    sharedPref.setBool(SplashScreenPage.LOGINKEY, true);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  },
                  child: Text("LogIn"))
            ],
          ),
        ),
      ),
    );
  }
}
