import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
class WorldTime{
  String location; //location name for ui
  String time; // time of the location entered
  String flag;//url to a asset flag icon
  String url;
  bool isDaytime; //ture if it day time else false
  WorldTime({this.location,this.flag,this.url});
  
  void getTime () async {
    try{
    Response response=await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data=jsonDecode(response.body);
    //print(data);
    //getting propertiies from data
    String datetime=data['datetime'];
    String offset=data['utc_offset'].substring(1,3);
    DateTime now=DateTime.parse(datetime);
    now=now.add(Duration(hours: int.parse(offset)));
    time=DateFormat.jm().format(now);
    isDaytime= now.hour>6 && now.hour<20 ?true:false;
    }
    catch(e)
    {

     
    }
  }
}