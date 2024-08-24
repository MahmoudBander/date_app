// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, override_on_non_overriding_member, unused_import



import 'package:flutter/material.dart';
import "dart:async";

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
  String year = "";
  String month = "";
  String dayNumber = "";
  String dayweek = "";
  // Time
  int hour = 0;
  String min = "";
  String sce = "";
  // Date
  String pmORam = "AM";
  changeEverySec() {
    Timer.periodic(Duration(seconds: 1), (Timer) {
      setState(() {
        // Time
        hour = DateTime.now().hour;
        if (hour > 12) {
          hour = hour - 12;
          pmORam = "PM";
        }
        min = DateTime.now().minute.toString();
        sce = DateTime.now().second.toString();
        // Date
        year = DateTime.now().year.toString();
        month = DateTime.now().month.toString();
        switch (month) {
          case "1":
            month = "January";
            break;
          case "2":
            month = "February";
            break;
          case "3":
            month = "March";
            break;
          case "4":
            month = "April";
            break;
          case "5":
            month = "May";
            break;
          case "6":
            month = "June";
            break;
          case "7":
            month = "July";
            break;
          case "8":
            month = "August";
            break;
          case "9":
            month = "September";
            break;
          case "10":
            month = "October";
            break;
          case "11":
            month = "November";
            break;
          case "12":
            month = "December";
            break;
        }

        dayNumber = DateTime.now().day.toString();
        dayweek = DateTime.now().weekday.toString();

        switch (dayweek) {
          case "1":
            dayweek = "Monday";
            break;
          case "2":
            dayweek = "Tuesday";
            break;
          case "3":
            dayweek = "Wednesday";
            break;
          case "4":
            dayweek = "Thursday";
            break;
          case "5":
            dayweek = "Friday";
            break;
          case "6":
            dayweek = "Saturday";
            break;
          case "7":
            dayweek = "Sunday";
            break;
        }
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
              "Todays Date is $dayweek",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "$month $dayNumber, $year",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "${hour.toString().padLeft(2, "0")}:${min.padLeft(2, "0")}:${sce.padLeft(2, "0")}    $pmORam",
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
