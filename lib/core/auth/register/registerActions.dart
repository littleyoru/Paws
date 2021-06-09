import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../constants/api_path.dart';

Future<http.Response> registerUser(data) async {
  // final response = await http.post(Uri.parse('$API_URL/user/register'));
  final uri = Uri.parse('http://10.0.2.2:3002/user/register');
  var body = json.encode(data);
  final response = await http.post(uri,
      headers: {
        // "Content-Type": "application/json",
        HttpHeaders.contentTypeHeader: "application/json",
        // HttpHeaders.authorizationHeader: 'Bearer '
      },
      body: body,
      encoding: Encoding.getByName("utf-8"));

  // final uri = Uri.parse('http://localhost:3000/user/test');
  // final response = await http.get(uri);

  if (response.statusCode == 200) {
    debugPrint('response body data: ${response.body}');
    final responseJson = jsonDecode(response.body);
    return responseJson;
  } else {
    throw Exception('Failure in the api');
  }
}
