import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store_demo/models/product.dart';

class HttpService {
  static const String baseUrl = "https://fakestoreapi.com";

  Future<String> login(String username, String password) async {
    try {
      final response = await http.post(Uri.parse('$baseUrl/auth/login'),
          body: {'username': username, 'password': password});

      // print('response: $response');
      // print('statuscode: ${response.statusCode}');

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        // print('data:$data');
        // print('Login successful');
        return data['token'];
      } else {
        return 'failed';
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<ProductList> fetchProducts() async {
    final response = await http.get(Uri.parse("$baseUrl/products"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return ProductList.fromJson(data);
    } else {
      throw Exception('Failed to load products');
    }
  }
}
