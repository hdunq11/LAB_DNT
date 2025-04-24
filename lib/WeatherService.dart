import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String client_id = 'VxkMgNP4FrP1FkAF1Tu8v';  // API Key
  final String client_secret = 'q6Odk3yRe1kwOCAsa5MKmo8m9VKPjrUQmEfuBYPF';         // Secret Key
  final String apiUrl = 'https://data.api.xweather.com/';  // URL của API

  // Hàm lấy dữ liệu thời tiết từ XWeather API
  Future<Map<String, dynamic>> getWeatherData(String location) async {
    final response = await http.get(
      Uri.parse('$apiUrl?places=$location&client_id={client_id}&client_secret={client_secret}'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Không thể lấy dữ liệu thời tiết');
    }
  }
}
