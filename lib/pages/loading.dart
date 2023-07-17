// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  

  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'Accra', flag: 'ghana.jpeg', url: 'Africa/Accra');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'IsDayTime':instance.IsDayTime,
    });
    
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
    
  }


  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      backgroundColor: Colors.blue[800],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SpinKitFadingCube(
            color: Colors.white,
            size: 90.0, 
          ),
          const SizedBox(height: 28.0),
          Text("Loading", 
            style: TextStyle(
              fontSize: 20, 
              color: Colors.white.withOpacity(0.7)
            ),
          ),
          const SizedBox(height: 64.0),
        ],
      ),
    );
  }
}