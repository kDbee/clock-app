
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;
    print(data);

    //set background
    String bgimage = data['IsDayTime']? 'day.jpg' : 'night.jpg';
    Color? bgColor = data['IsDayTime']? Colors.blue : Colors.grey[900];

    return Scaffold(
      backgroundColor: bgColor,
      body:  SafeArea(
        child: Container(
          decoration:  BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/$bgimage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                  onPressed: () async{
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time' : result['time'],
                        'location' : result['location'],
                        'IsDayTime' : result['IsDayTime'],
                        'flag' : result['flag'],
                      };
                    });
                  },
                  icon: Icon(
                     Icons.edit_location,
                     color: Colors.grey [300],
                  ),
                  label:  Text(
                    'Edit Location',
                    style:  TextStyle(
                      color: Colors.grey[300],
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                     Text(
                      data['location'],
                      style: const TextStyle(
                        fontSize: 30.0,
                        letterSpacing: 1.5,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
        
                Text(
                  data['time'],
                  style: const TextStyle(
                    fontSize: 60.0,
                     color: Colors.white,
                  ),
                ),
              ]  
            ),
          ),
        ),
      ),
    );
  }
}