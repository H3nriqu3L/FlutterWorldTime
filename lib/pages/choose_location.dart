import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
      latitude: 51.5074,
      longitude: -0.1278,
      flagUrl: 'Flag_of_England.png',
      location: 'London',
    ),
    WorldTime(
      latitude: -23.5505,
      longitude: -46.6333,
      flagUrl: 'Flag_of_Brazil.png',
      location: 'Sao Paulo',
    ),
    WorldTime(
      latitude: 42.3601,
      longitude: -71.0589,
      flagUrl: 'Flag_of_USA.png',
      location: 'Boston',
    ),
    WorldTime(
      latitude: 40.7128,
      longitude: -74.0060,
      flagUrl: 'Flag_of_USA.png',
      location: 'New York',
    ),
    WorldTime(
      latitude: 30.0444,
      longitude: 31.2357,
      flagUrl: 'Flag_of_Egypt.png',
      location: 'Cairo',
    ),
    WorldTime(
      latitude: 39.9042,
      longitude: 116.4074,
      flagUrl: 'Flag_of_China.png',
      location: 'Beijing', 
    ),
    WorldTime(
      latitude: 37.9838,
      longitude: 23.7275,
      flagUrl: 'Flag_of_Greece.png',
      location: 'Athens', 
    ),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flagUrl,
      'time': instance.time,
      'isDayTime': instance.isDaytime,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text('Choose Location', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
  
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0 ),
            child: Card(
              color: Colors.grey[300],
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(backgroundImage: AssetImage('assets/${locations[index].flagUrl}'),),
                
              ),
            ),
          );
        },
        ),
    );
  }
}
