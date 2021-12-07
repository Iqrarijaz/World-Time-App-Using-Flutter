import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/World_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


import 'dart:convert';

class Loading extends StatefulWidget {

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Future<void> setWorldTime ()  async {
    WorldTime instance=WorldTime(location: 'Islamabad , Pakistan',flag: 'pak.jpg',url: 'Asia/Karachi');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime,
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[600],
      body: Center(
      child: SpinKitHourGlass(
        color: Colors.white,
        size: 100,
      ),
      )
    );
  }
}
