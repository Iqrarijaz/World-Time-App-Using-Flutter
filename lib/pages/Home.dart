import 'package:flutter/material.dart';
class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  @override
  Widget build(BuildContext context) {

    data=data.isNotEmpty ? data :ModalRoute.of(context).settings.arguments;
    print(data);
    // setting background image
    String bgImage=data['isDaytime'] ? 'day2.jpg': 'night1.jpg';
    Color bgColor=data['isDaytime'] ? Colors.blue[300]: Colors.black45;
    Color textColor=data['isDaytime'] ? Colors.black : Colors.grey[200];
    print(bgImage);
    return Scaffold(
      backgroundColor: bgColor,
      body:SafeArea (
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
          ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async {
                      dynamic result= await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data={
                          'time':result['time'],
                          'location':result['location'],
                          'flag':result['flag'],
                          'isDaytime':result['isDaytime']
                        };
                      });
                    },
                  icon: Icon(
                      Icons.edit_location
                  ,color: textColor
                    ,),
                  label: Text('Edit Location',
                  style: TextStyle(
                    color: textColor,
                  ),),
                ),
                SizedBox(height: 30.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(data['location'],
                    style: TextStyle(
                      fontSize: 20.0,
                      letterSpacing: 2,
                      color: textColor,
                    ),
                    ),
                  ],
                ),
                SizedBox(height: 30.0,),
                Text(data['time'],
                style: TextStyle(
                  fontSize: 60.0,
                  letterSpacing: 2,
                  color: textColor,
                ),),
              ],
            ),
          ),
        ),
      )
      );
  }
}
