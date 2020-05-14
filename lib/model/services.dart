import 'dart:convert';

import 'package:http/http.dart' as http;
import 'category.dart';
import 'file.dart';

class Services{
  static const String urlC= 'http://localhost:3000/tablaTickets/api';
  static const String urlA = 'http://localhost:3000/tablaAsignacion/api';

  static Future<List<Category>> getCategories() async {
    try {
      final response = await http.get(urlC);
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

  static Future<List<File>> getFiles() async {
    try {
      final response = await http.get(urlA);
      if (response.statusCode == 200) {
        List<File> list = parseFiles(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  static List<File> parseFiles(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<File>((json) => File.fromJson(json)).toList();
  }

}