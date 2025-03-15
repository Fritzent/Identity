import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class ThemeUtils {
  static Map<String, String> parseSunriseSunsetData(
      Map<String, dynamic> results) {
    DateTime now = DateTime.now();
    DateFormat inputFormat = DateFormat("h:mm:ss a");

    DateTime parsedTimeSunrise = inputFormat.parse(results['sunrise']);
    DateTime fullSunriseDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        parsedTimeSunrise.hour,
        parsedTimeSunrise.minute,
        parsedTimeSunrise.second);

    DateTime parsedTimeSunset = inputFormat.parse(results['sunset']);
    DateTime fullSunsetDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        parsedTimeSunset.hour,
        parsedTimeSunset.minute,
        parsedTimeSunset.second);

    return {
      'sunrise': fullSunriseDateTime.toLocal().toIso8601String(),
      'sunset': fullSunsetDateTime.toLocal().toIso8601String(),
    };
  }

  static Future<Map<String, String>?> fetchSunriseSunsetInBackground(
      List<double> args) async {
    final double lat = args[0];
    final double lon = args[1];

    try {
      final url =
          "https://api.sunrisesunset.io/json?lat=$lat&lng=$lon&timezone=auto";
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return parseSunriseSunsetData(data['results']);
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
