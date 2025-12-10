import 'dart:convert';
import 'package:http/http.dart' as http;
import 'fruit.dart';

class ApiService {
  // ================================
  // 1️⃣ SHOW / GET ALL FRUITS
  // ================================
  static Future<List<Fruits>> getFruits() async {
    final url = Uri.parse("YOUR_GET_API_URL");

    final res = await http.get(url);

    if (res.statusCode == 200) {
      List data = json.decode(res.body);

      return data.map((e) => Fruits.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load fruits");
    }
  }

  // ================================
  // 2️⃣ INSERT NEW FRUIT
  // ================================
  static Future<bool> insertFruit(Fruits fruit) async {
    final url = Uri.parse("YOUR_INSERT_API_URL");

    final body = {
      "id": fruit.id,
      "name": fruit.name,
    };

    final res = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    return res.statusCode == 200;
  }

  // ================================
  // 3️⃣ UPDATE FRUIT
  // ================================
  static Future<bool> updateFruit(Fruits fruit) async {
    final url = Uri.parse("YOUR_UPDATE_API_URL");

    final body = {
      "id": fruit.id,
      "name": fruit.name,
    };

    final res = await http.put(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    return res.statusCode == 200;
  }

  // ================================
  // 4️⃣ DELETE FRUIT
  // ================================
  static Future<bool> deleteFruit(String id) async {
    final url = Uri.parse("YOUR_DELETE_API_URL?id=$id");

    final res = await http.delete(url);

    return res.statusCode == 200;
  }
}
