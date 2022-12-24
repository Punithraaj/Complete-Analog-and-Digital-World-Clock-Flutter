import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_clock/util/clockPainter.dart';
import 'package:flutter_clock/util/utility.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'location_screen.dart';

class ClockView extends StatefulWidget {
  const ClockView({Key? key}) : super(key: key);

  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    setInitialLocation();
    Timer.periodic(
        Duration(seconds: 1),
        (Timer t) => setState(() {
              // print("newlocationName");
              // print(locationName);
              currentTime = getCurrentTime(locationName);
            }));
    super.initState();
  }

  setInitialLocation() async {
    locationName = await getLocationFromSharedPref();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
          child: Container(
            child: Text(
              getFormatedTime(),
              style: kTimeTextStyle,
            ),
          ),
        ),
      ),
      Container(
        width: 320,
        height: 320,
        child: Stack(alignment: Alignment.center, children: [
          Container(
            constraints: const BoxConstraints.expand(),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color(0xffE3EDF7),
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                    colors: [Color(0xffecf6ff), Color(0xffcadbeb)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 32,
                    spreadRadius: 1,
                    offset: const Offset(30, 20),
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    blurRadius: 32,
                    spreadRadius: 1,
                    offset: Offset(-20, -10),
                  ),
                ]),
          ),
          Container(
            width: 140,
            height: 140,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xffE3EDF7),
                gradient: const LinearGradient(
                    colors: [Color(0xffecf6ff), Color(0xffcadbeb)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 32,
                    spreadRadius: 1,
                    offset: const Offset(30, 20),
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    blurRadius: 32,
                    spreadRadius: 1,
                    offset: Offset(-20, -10),
                  ),
                ]),
          ),
          Container(
            constraints: BoxConstraints.expand(),
            child: Transform.rotate(
                angle: -pi / 2, child: CustomPaint(painter: ClockPainter())),
          ),
        ]),
      ),
      Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
          child: Container(
            child: Text(
              locationName,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Varela',
                color: Color(purple),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
