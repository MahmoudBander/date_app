// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, override_on_non_overriding_member, unused_import

import 'package:flutter/material.dart';
import "dart:async";
import 'package:intl/intl.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: DateApp(),
    );
  }
}

class DateApp extends StatefulWidget {
  const DateApp({super.key});

  @override
  State<DateApp> createState() => _DateAppState();
}

class _DateAppState extends State<DateApp> {
  String weekday = "";
  String date = "";
  String timeNow = "";

  changeEverySec() {
    Timer.periodic(Duration(seconds: 1), (Timer) {
      setState(() {
        weekday =(DateFormat("EEEE").format(DateTime.now()));
        date = (DateFormat("MMMM d, y").format(DateTime.now()));
        timeNow = (DateFormat("hh : mm : ss a").format(DateTime.now()));
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeEverySec();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 40, 43),
      appBar: AppBar(
        title: Text(
          "Time & Date App",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 57, 73, 80),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Todays Date is $weekday",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              date,
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              timeNow,
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
