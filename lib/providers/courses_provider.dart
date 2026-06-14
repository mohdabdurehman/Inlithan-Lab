import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';
import 'auth_provider.dart';

class CoursesProvider extends ChangeNotifier {
  final AuthProvider authProvider;

  CoursesProvider(this.authProvider);

  List<dynamic> courses = [];
  List<dynamic> exploreCourses = [];
  bool loading = false;

  Map<String, String> get _headers => {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authProvider.token}',
      };

  Future<void> fetchCourses() async {
    if (authProvider.token == null) return;
    loading = true;
    notifyListeners();

    try {
      final res = await http.get(
        Uri.parse('${ApiConfig.baseUrl}/courses'),
        headers: _headers,
      );
      final data = jsonDecode(res.body);
      if (data['success'] == true) {
        courses = data['data'] ?? [];
      }
    } catch (e) {
      debugPrint('fetchCourses error: $e');
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> fetchExploreCourses() async {
    if (authProvider.token == null) return;
    try {
      final res = await http.get(
        Uri.parse('${ApiConfig.baseUrl}/courses/explore'),
        headers: _headers,
      );
      final data = jsonDecode(res.body);
      if (data['success'] == true) {
        exploreCourses = data['data'] ?? [];
        notifyListeners();
      }
    } catch (e) {
      debugPrint('fetchExploreCourses error: $e');
    }
  }
}
