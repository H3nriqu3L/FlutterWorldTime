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
    data =
        data.isNotEmpty
            ? data
            : ModalRoute.of(context)?.settings.arguments as Map;
    print(data);

    String bgImage;
    String location = data['location'];

    if (location == 'Sao Paulo') {
      bgImage = data['isDayTime'] ? 'sao_paulo_day.jpg' : 'sao_paulo_night.jpg';
    } else if (location == 'London') {
      bgImage = data['isDayTime'] ? 'london_day.jpg' : 'london_night.jpg';
    } else if (location == 'New York') {
      bgImage = data['isDayTime'] ? 'new_york_day.jpg' : 'new_york_night.jpg';
    } else if (location == 'Boston') {
      bgImage = data['isDayTime'] ? 'boston_day.jpg' : 'boston_night.jpg';
    } else if (location == 'Cairo') {
      bgImage = data['isDayTime'] ? 'cairo_day.jpg' : 'cairo_night.jpg';
    } else if (location == 'Beijing') {
      bgImage = data['isDayTime'] ? 'beijing_day.jpg' : 'beijing_night.jpg';
    } else if (location == 'Athens') {
      bgImage = data['isDayTime'] ? 'athens_day.jpg' : 'athens_night.jpg';
    } else {
      bgImage = data['isDayTime'] ? 'default_day.jpg' : 'default_night.jpg';
    }
    Color bgColor = data['isDayTime'] ? Colors.white : Colors.grey[800]!;
    Color textColor = data['isDayTime'] ? Colors.black : Colors.grey.shade200;
    Color shadowColor = data['isDayTime'] ? Colors.grey : Colors.black;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0.0, 0.0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(
                      context,
                      '/location',
                    );
                    if (result != null) {
                      setState(() {
                        print(data);
                        data = {
                          'time': result['time'] ?? data['time'],
                          'location': result['location'] ?? data['location'],
                          'isDayTime': result['isDayTime'] ?? data['isDayTime'],
                          'flag': result['flag'] ?? data['flag'],
                          'longitude': result['longitude'] ?? data['longitude'],
                          'latitude': result['latitude'] ?? data['latitude'],
                        };
                      });
                    }
                  },
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 20.0,
                      shadows: [
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 3.0,
                          color: shadowColor.withValues(),
                        ),
                      ],
                    ),
                  ),
                  icon: Icon(
                    Icons.edit_location,
                    color: textColor,
                    size: 25.0,
                    shadows: [
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 3.0,
                        color: shadowColor.withValues(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        color: textColor,
                        fontSize: 30.0,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: Offset(1.0, 1.0),
                            blurRadius: 3.0,
                            color: shadowColor.withValues(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 70.0,
                    color: textColor,
                    shadows: [
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 3.0,
                        color: shadowColor.withValues(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
