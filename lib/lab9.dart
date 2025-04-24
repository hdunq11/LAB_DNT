import 'package:flutter/material.dart';
import 'WeatherService.dart';

class WeatherScreen extends StatefulWidget {
  final String city;
  final String temperature;
  final String description;

  WeatherScreen({required this.city, required this.temperature, required this.description});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String city = '';
  String temperature = '';
  String description = '';
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    city = widget.city;
    temperature = widget.temperature;
    description = widget.description;
  }

  // Hàm tra cứu thời tiết cho thành phố
  void _getWeatherForCity(String city) async {
    setState(() {
      isLoading = true;
    });
    try {
      WeatherService weatherService = WeatherService();
      var weatherData = await weatherService.getWeatherData(city);

      setState(() {
        temperature = weatherData['main']['temp'].toString();
        description = weatherData['weather'][0]['description'];
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        temperature = 'Không thể lấy dữ liệu thời tiết.';
        description = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Thời tiết')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Thành phố: $city',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              '$temperature°C',
              style: TextStyle(fontSize: 50),
            ),
            Text(description),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(hintText: 'Nhập tên thành phố'),
              onChanged: (text) {
                city = text;
              },
              onSubmitted: (text) {
                _getWeatherForCity(text);
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _getWeatherForCity(city),
              child: Text('Lấy Thời Tiết'),
            ),
            if (isLoading) CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}