import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionState extends ChangeNotifier {
  String? _token;

  bool get isAuthenticated => _token != null && _token!.isNotEmpty;
  String? get token => _token;

  Future<void> setToken(String? token) async {
    _token = token;
    final prefs = await SharedPreferences.getInstance();
    if (token == null || token.isEmpty) {
      await prefs.remove('jwt_token');
    } else {
      await prefs.setString('jwt_token', token);
    }
    notifyListeners();
  }

  Future<void> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString('jwt_token');
    _token = saved;
    notifyListeners();
  }

  Future<void> clear() async {
    _token = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('jwt_token');
    notifyListeners();
  }
}

