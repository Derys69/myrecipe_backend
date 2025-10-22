import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl;
  String? token;

  ApiClient({required this.baseUrl});

  Map<String, String> _headers({bool jsonBody = true}) {
    final headers = <String, String>{};
    if (jsonBody) headers['Content-Type'] = 'application/json';
    if (token != null && token!.isNotEmpty) headers['Authorization'] = 'Bearer $token';
    return headers;
  }

  Future<String?> login(String email, String password) async {
    final uri = Uri.parse('$baseUrl/auth/login');
    final resp = await http.post(uri, headers: _headers(), body: jsonEncode({'email': email, 'password': password}));
    if (resp.statusCode >= 200 && resp.statusCode < 300) {
      final data = jsonDecode(resp.body) as Map<String, dynamic>;
      token = data['token'] as String?;
      return token;
    }
    throw Exception('Login failed: ${resp.statusCode} ${resp.body}');
  }

  Future<List<dynamic>> getRecipes() async {
    final uri = Uri.parse('$baseUrl/recipes/');
    final resp = await http.get(uri, headers: _headers(jsonBody: false));
    if (resp.statusCode == 200) {
      return jsonDecode(resp.body) as List<dynamic>;
    }
    throw Exception('Failed to load recipes: ${resp.statusCode}');
  }

  Future<List<dynamic>> searchRecipes(String ingredient) async {
    final uri = Uri.parse('$baseUrl/recipes/search?ingredient=$ingredient');
    final resp = await http.get(uri, headers: _headers(jsonBody: false));
    if (resp.statusCode == 200) {
      return jsonDecode(resp.body) as List<dynamic>;
    }
    throw Exception('Search failed: ${resp.statusCode}');
  }

  Future<Map<String, dynamic>> toggleFavorite({required int userId, required int recipeId}) async {
    final uri = Uri.parse('$baseUrl/favorites/toggle');
    final resp = await http.post(uri, headers: _headers(), body: jsonEncode({'user_id': userId, 'recipe_id': recipeId}));
    if (resp.statusCode >= 200 && resp.statusCode < 300) {
      return jsonDecode(resp.body) as Map<String, dynamic>;
    }
    throw Exception('Toggle favorite failed: ${resp.statusCode} ${resp.body}');
  }
}

