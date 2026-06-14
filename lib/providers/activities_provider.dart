import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';
import 'auth_provider.dart';

class ActivitiesProvider extends ChangeNotifier {
  final AuthProvider authProvider;

  ActivitiesProvider(this.authProvider);

  List<dynamic> activities = [];
  bool loading = false;

  Map<String, String> get _headers => {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authProvider.token}',
      };

  Future<void> fetchActivities() async {
    if (authProvider.token == null) return;
    loading = true;
    notifyListeners();

    try {
      final res = await http.get(
        Uri.parse('${ApiConfig.baseUrl}/activities'),
        headers: _headers,
      );
      final data = jsonDecode(res.body);
      if (data['success'] == true) {
        activities = data['data'] ?? [];
      }
    } catch (e) {
      debugPrint('fetchActivities error: $e');
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
