import 'package:flutter/material.dart';
import 'package:flutter_clock/util/utility.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class LocationList extends StatefulWidget {
  final String selectedLocation;
  LocationList({required this.selectedLocation});

  @override
  _LocationListState createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {
  List<String> timezoneList = [];
  @override
  void initState() {
    // TODO: implement initState
    timezoneList = getTimeZoneLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context),
        backgroundColor: Color(silver),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: getListView(),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        backgroundColor: Color(silver),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Wolrd Clock",
          style: kTopRowTextStyle,
        ));
  }

  Widget getListView() {
    var listView = ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            timezoneList[index],
            style: widget.selectedLocation == timezoneList[index]
                ? kSelectedTextStyle
                : kTopRowTextStyle,
          ),
          onTap: () {
            Navigator.pop(context, timezoneList[index]);
          },
        );
      },
      itemCount: timezoneList.length,
    );
    return listView;
  }
}
