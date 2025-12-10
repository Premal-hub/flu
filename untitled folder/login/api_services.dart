import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServices {

  Future<void> login(String email, password) async {

    final url = Uri.parse("https://www.sparkstoideas.com/LJ/api/login");
    print("login");

    try {
      print("login");

      final response = await http.post(
        url,
        body: {
          "Email": email,
          "Password": password,
        },
      );

      print("login");
      print(response.body);

      if (response.statusCode == 200) {

        // Decode JSON response
        final data = jsonDecode(response.body);

        print(data);

        if (data['status'] == 'success') {

          // Login successful

        } else {
          // Login failed (wrong credentials, etc.)
        }
      }
      else {
        // HTTP error (not 200 OK)

      }
    } catch (e) {
      // Any other error (like no internet, etc.)
    }
  }

}
