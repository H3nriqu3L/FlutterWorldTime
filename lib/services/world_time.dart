import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time = '';  // Time in that location
  String flagUrl;
  double latitude;
  double longitude;
  bool isDaytime = true;

  WorldTime({required this.latitude, required this.longitude, required this.flagUrl, required this.location});


  Future<void> getTime() async {
    final apiKey = 'Your API Key';
    Response response = await get(
      Uri.parse(
        'https://api.api-ninjas.com/v1/worldtime?lat=$latitude&lon=$longitude',
      ),
      headers: {'X-Api-Key': apiKey},
    );
    Map data = jsonDecode(response.body);

    String datetime = data['datetime'];
    DateTime date = DateTime.parse(datetime);
    isDaytime = date.hour>6 && date.hour <20 ? true : false;
    time = DateFormat.jm().format(date);

  }
}


