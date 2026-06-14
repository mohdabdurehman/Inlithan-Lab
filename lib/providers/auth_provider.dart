import 'dart:convert';
import 'package:flutter/material.dart';
import '../services/token_storage.dart';

class AuthProvider extends ChangeNotifier {
  String? _token;
  Map<String, dynamic>? _user;
  bool _loading = true;

  String? get token => _token;
  Map<String, dynamic>? get user => _user;
  bool get loading => _loading;
  bool get isLoggedIn => _token != null;
  String? get role => _user?['role'];

  Future<void> loadFromStorage() async {
    _token = await TokenStorage.getToken();
    if (_token != null) {
      _user = _decodeToken(_token!);
    }
    _loading = false;
    notifyListeners();
  }

  Future<void> setToken(String token) async {
    _token = token;
    _user = _decodeToken(token);
    await TokenStorage.saveToken(token);
    notifyListeners();
  }

  Future<void> logout() async {
    _token = null;
    _user = null;
    await TokenStorage.deleteToken();
    notifyListeners();
  }

  Map<String, dynamic>? _decodeToken(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return null;

      String normalized = parts[1].replaceAll('-', '+').replaceAll('_', '/');
      switch (normalized.length % 4) {
        case 2:
          normalized += '==';
          break;
        case 3:
          normalized += '=';
          break;
      }

      final payload = utf8.decode(base64.decode(normalized));
      return jsonDecode(payload) as Map<String, dynamic>;
    } catch (e) {
      return null;
    }
  }
}
