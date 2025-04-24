import 'package:flutter/material.dart';
import '../services/weather.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getLocationData(); // gọi lần đầu
  }

  void getLocationData() async {
    setState(() {
      isLoading = true;
    });

    var weatherData = await WeatherModel().getLocationWeather();

    print('[DEBUG] Gọi lại vị trí xong - dữ liệu thời tiết: $weatherData');

    setState(() {
      isLoading = false;
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(locationWeather: weatherData),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: isLoading
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
            const SizedBox(height: 20),
            Text(
              'Đang lấy vị trí...',
              style: TextStyle(color: Colors.white),
            ),
          ],
        )
            : ElevatedButton(
          onPressed: getLocationData,
          child: Text('Lấy lại vị trí sau khi geo fix'),
        ),
      ),
    );
  }
}
