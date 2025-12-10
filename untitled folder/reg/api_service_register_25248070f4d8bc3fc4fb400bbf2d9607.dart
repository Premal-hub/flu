import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiService {

  String baseUrl = 'https://www.sparkstoideas.com/LJ/api/register';

  Future<Map<String, dynamic>> registerUser(
      String name, String surname,
      String email, String password) async {

    print("registerUser");
    final Map<String, String> requestBody = {
      'Name': name,
      'SurName': surname,
      'Email': email,
      'Password': password,
    };

    try {

      final response = await http.post(
        Uri.parse(baseUrl),
        // headers: {'Content-Type': 'application/json'},
        body: json.encode(requestBody),
      );

      print(response.body);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return responseData; // Return the response data (e.g., success message)
      } else {
        // throw Exception("");
        return {
          'status': 'error',
          'message': 'Failed to register. Status Code: ${response.statusCode}'
        };
      }
    } catch (e) {
      return {
         'status': 'error',
        'message': 'An error occurred: $e',
      };
    }
  }
}
