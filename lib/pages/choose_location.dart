import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';


class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  
  List<WorldTime> location = [
    WorldTime(location: 'Luanda', flag: 'angola.jfif', url: 'Africa/Luanda'),
    WorldTime(location: 'Porto-Novo', flag: 'benin.jpg', url: 'Africa/Porto-Novo'),
    WorldTime(location: 'Tunis', flag: 'tunisia.jpg', url: 'Africa/Tunis'),
    WorldTime(location: 'Moroni', flag: 'comoros.jpg', url: 'Africa/Moroni'),
    WorldTime(location: 'Accra', flag: 'ghana.jpg', url: 'Africa/Acrra'),
    WorldTime(location: 'Abuja', flag: 'nigeria.jpg', url: 'Africa/Lagos'),
    WorldTime(location: 'Nairobi', flag: 'kenyan.jpg', url: 'Africa/Nairobi'),
    WorldTime(location: 'Behia', flag: 'brazil.jpg', url: 'America/Bahia'),
    WorldTime(location: 'Denver', flag: 'america.jpg', url: 'America/Denver'),
    WorldTime(location: 'Mexico City', flag: 'mexico.jpg', url: 'America/Mexico_City'),
    WorldTime(location: 'Syowa', flag: 'america.jpg', url: 'Antarctica/Syowa'),
  ];
  
  void updateTime(index) async{
    WorldTime instance = location[index]; 
    await instance.getTime();
    //navigate to home screen
    // ignore: use_build_context_synchronously
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'IsDayTime':instance.IsDayTime,
    });
  }
 

  @override
  Widget build(BuildContext context) {
    print('build function run');
    return  Scaffold(
      backgroundColor: const Color(0xffeeeeee),
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: location.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title:  Text(location[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('images/${location[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}