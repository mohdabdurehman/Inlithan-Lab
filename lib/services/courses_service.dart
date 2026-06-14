import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';

class CoursesService {
  static Future<Map<String, dynamic>> createCourse({
    required String token,
    required String title,
    required String about,
    required String code,
    List<String> aboutPoints = const [],
    String aboutClosing = '',
  }) async {
    final res = await http.post(
      Uri.parse('${ApiConfig.baseUrl}/courses'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'title': title,
        'about': about,
        'code': code,
        'aboutPoints': aboutPoints,
        'aboutClosing': aboutClosing,
      }),
    );
    return jsonDecode(res.body);
  }
}
