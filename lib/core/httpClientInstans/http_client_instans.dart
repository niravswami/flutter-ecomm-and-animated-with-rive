import 'dart:convert';

import 'package:ecomm_bloc_app/core/constants/http_constants.dart';
import 'package:ecomm_bloc_app/init_dependencies.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HttpClientInstance {
  static final HttpClientInstance _instance = HttpClientInstance._internal();

  factory HttpClientInstance() {
    return _instance;
  }

  HttpClientInstance._internal();

  final SharedPreferences _sharedPreferences = serviceLocator<
      SharedPreferences>(); // Access SharedPreferences using serviceLocator

  Future<String?> _getAccessToken() async {
    return _sharedPreferences.getString('accessToken') ?? '';
  }

  Future<Map<String, String>> _getHeaders() async {
    final accessToken = await _getAccessToken();
    print('ka');
    print(accessToken);
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
  }

  Future<http.Response> getReq(String endpoint) async {
    final response = await http.get(
      Uri.parse('${HttpConstants.baseUrl}$endpoint'),
      headers: await _getHeaders(),
    );
    return response;
  }

  Future<http.Response> postReq(String endpoint, dynamic data) async {
    print(data);
    final response = await http.post(
      Uri.parse('${HttpConstants.baseUrl}$endpoint'),
      body: jsonEncode(data),
      headers: await _getHeaders(),
    );
    return response;
  }

  Future<http.Response> putReq(String endpoint, dynamic data) async {
    final response = await http.put(
      Uri.parse('${HttpConstants.baseUrl}$endpoint'),
      body: jsonEncode(data),
      headers: await _getHeaders(),
    );
    return response;
  }

  Future<http.Response> deleteReq(String endpoint) async {
    final response = await http.delete(
      Uri.parse('${HttpConstants.baseUrl}$endpoint'),
      headers: await _getHeaders(),
    );
    return response;
  }
}
