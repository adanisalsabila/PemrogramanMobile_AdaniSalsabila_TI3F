import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'pizza.dart';

class HttpHelper {
  // GANTI DENGAN DOMAIN WIREMOCK ANDA SENDIRI (Tanpa https://)
  // Contoh: 'x8ki4.wiremockapi.cloud'
  final String authority = 'r1v9l.wiremockapi.cloud'; 
  
  final String path = 'pizzalist';

  Future<List<Pizza>> getPizzaList() async {
    final Uri url = Uri.https(authority, path);
    final http.Response result = await http.get(url);

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      // Mengonversi List Map menjadi List<Pizza>
      List<Pizza> pizzas =
          jsonResponse.map<Pizza>((i) => Pizza.fromJson(i)).toList();
      return pizzas;
    } else {
      return [];
    }
  }
}