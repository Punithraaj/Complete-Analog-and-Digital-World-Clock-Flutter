import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart';
import 'package:intl/intl.dart';

enum Choice { WorldTime, CurrentTime }

String locationName = 'Asia/Kolkata';
DateTime currentTime = DateTime.now();

Future<String> getLocationFromSharedPref() async {
  final prefs = await SharedPreferences.getInstance();
  final lastUsedLocation = prefs.getString('Location');

  return lastUsedLocation ?? 'Asia/Kolkata';
}

Future<void> setLocationPref(String location) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString('Location', location);
}

List<String> getTimeZoneLocation() {
  tz.initializeTimeZones();
  return tz.timeZoneDatabase.locations.keys.toList();
}

getCurrentTime(String locationName) {
  tz.initializeTimeZones();
  var location = tz.getLocation(locationName);
  return tz.TZDateTime.now(location);
}

getFormatedTime() {
  return DateFormat("hh:mm a").format(currentTime);
}

const int purple = 0xff3c1361;
const int red = 0xffff2525;
const int brightYellow = 0xffffe03d;
const int midYellow = 0xffffd03d;
const int yellow = 0xffffc03d;
const int silver = 0xfff2f5fc;
const int darkSilver = 0xffe7eefb;

const kTopRowTextStyle = TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'Varela',
  color: Color(purple),
);

const kSelectedTextStyle = TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'Varela',
  color: Color(midYellow),
);

const kTimeTextStyle = TextStyle(
  fontSize: 56.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'Varela',
  color: Color(purple),
);
