import 'dart:convert';

import 'package:http/http.dart' as http;
import 'category.dart';

class Services{
  static const String url = 'http://localhost:3000/tablaTickets/api';

  static Future<List<Category>> getCategories() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<Category> list = parseCategories(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Category> parseCategories(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Category>((json) => Category.fromJson(json)).toList();

  }

}