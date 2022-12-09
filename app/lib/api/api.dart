import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class API {
  static const String baseUrl = kReleaseMode
      ? "<prod server>" // TODO: Change this to your server's URL
      : "localhost:3000";

  Future<Response> get(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    final url = Uri.http(baseUrl, path, getQueryParameters(queryParameters));
    final response = await http.get(url, headers: headers);
    return response;
  }

  Map<String, String>? getQueryParameters(Map<String, dynamic>? parameters) {
    if (parameters == null) return null;
    Map<String, String> queryParameters = {};
    parameters.forEach((key, value) {
      if (value != null) queryParameters[key] = value.toString();
    });
    return queryParameters;
  }
}
