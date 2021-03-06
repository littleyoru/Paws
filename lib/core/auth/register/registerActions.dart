import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:paws/core/auth/register/registerResponse.dart';
import 'dart:convert';
import 'dart:io';
import '../../../constants/api_path.dart';

Future<RegisterResponse> registerUser(data) async {
  // final response = await http.post(Uri.parse('$API_URL/user/register'));
  final uri = Uri.parse('$API_URL/user/register');
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
    final responseJson = jsonDecode(response.body);
    final registerResponse = RegisterResponse.fromJson(responseJson);
    return registerResponse;
  } else {
    throw Exception('Failure in the api');
  }
}
