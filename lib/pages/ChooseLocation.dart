import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/World_time.dart';
class ChooseLocation extends StatefulWidget {

  void getData()
  {

  }
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime>locations=[
    WorldTime(url:'Europe/London',location:'London , UK',flag:'uk.jpg'),
    WorldTime(url:'Asia/Karachi',location:'Islamabad , Pakistan',flag:'pak.jpg'),
    WorldTime(url:'America/Chicago',location:'Chicago',flag:'chicago.jpg'),
    WorldTime(url:'America/Los_Angeles',location:'Los Angeles',flag:'los_ang.jpg'),
    WorldTime(url:'Asia/Dubai',location:'Dubai',flag:'dubai.jpg'),
    WorldTime(url:'Asia/Kabul',location:'Kabul',flag:'afg.jpg'),
    WorldTime(url:'Asia/Kolkata',location:'Kolkata , India',flag:'india.jpg'),

  ];
  void updateTime(index) async {
    WorldTime instance=locations[index];
    await instance.getTime();
    Navigator.pop(context,{
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
  }
  @override
  Widget build(BuildContext context) {
    print("Build Run");
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body:  SafeArea(
        child: Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(image: new AssetImage("assets/map.jpg"), fit: BoxFit.cover,),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ListView.builder(

                itemCount: locations.length,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1.0,vertical: 4.0),
                    child: Card(
                      color: Colors.grey[300],

                      child: ListTile(
                        onTap: (){
                          updateTime(index);
                        },
                        title: Text(locations[index].location),

                        leading: CircleAvatar(
                          backgroundImage: AssetImage('assets/${locations[index].flag}'),
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
        ),
      ),
    );
  }
}
