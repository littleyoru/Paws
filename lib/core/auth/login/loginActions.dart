import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import '../../../constants/api_path.dart';
import 'loginResponse.dart';

Future<LoginResponse> loginUser(data) async {
  final uri = Uri.parse('$API_URL/user/login');
  var body = json.encode(data);
  final response = await http.post(uri,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        // HttpHeaders.authorizationHeader: 'Bearer '
      },
      body: body,
      encoding: Encoding.getByName("utf-8"));

  if (response.statusCode == 200) {
    debugPrint('response body data: ${response.body}');
    debugPrint('response headers: ${response.headers}');
    final responseJson = jsonDecode(response.body);
    final loginResponse = LoginResponse.fromJson(responseJson);
    debugPrint('login response parsed: $loginResponse');
    return loginResponse;
  } else {
    throw Exception('Failure in the api');
  }
}
