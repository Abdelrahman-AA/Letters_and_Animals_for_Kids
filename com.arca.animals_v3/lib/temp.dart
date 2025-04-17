import 'dart:async';

import 'package:animals_v3/panner_ad.dart';
import 'package:flutter/material.dart';

class Temp extends StatefulWidget {
  const Temp({super.key});

  @override
  State<Temp> createState() => _TempState();
}

class _TempState extends State<Temp> {
  @override
  void initState() {
    Timer.run(() {
      handleTimeout2() {
        if (toopen == false) {
          showDialog(
              context: context,
              builder: ((context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  backgroundColor: Color.fromARGB(255, 241, 225, 169).withOpacity(.85),
                  content: Text(
                    "يرجى التأكد من الاتصال بشبكة الانترنت",
                    textAlign: TextAlign.center,
                  ),
                  contentTextStyle: TextStyle(color: Color.fromARGB(255, 4, 56, 6), fontSize: 17),
                );
              }));
        }
        Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);
      }

      Timer scheduleTimeouut([int milliseconds = 200]) => Timer(Duration(milliseconds: milliseconds), handleTimeout2);
      scheduleTimeouut();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Color.fromARGB(255, 215, 226, 183),
        child: Container(
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/logo.png"), fit: BoxFit.contain)),
        ),
      ),
    );
  }
}
