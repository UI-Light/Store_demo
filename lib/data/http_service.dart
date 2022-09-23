import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:store_demo/models/cart.dart';
import 'package:store_demo/models/product.dart';

class HttpService {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  late String? userId;
  static const String baseUrl = "https://fakestoreapi.com";

  Future<String> login(String username, String password) async {
    //try {
    final response = await http.post(Uri.parse('$baseUrl/auth/login'),
        body: {'username': username, 'password': password});

    print('response: $response');
    print('statuscode: ${response.statusCode}');

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print('data:$data');
      print('Login successful');

      return data['token'];
    } else {
      return 'failed';
    }
    // } catch (e) {
    //   return e.toString();
    // }
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

  Future<String> getUserid() async {
    userId = await storage.read(key: "uiD");
    return userId!;
  }

  Future<String> addToCart(String date, products) async {
    // try {
    String userId = await getUserid();
    final response = await http.post(Uri.parse('$baseUrl/carts'),
        body: {'userId': userId, 'date': date, 'products': products});

    print('response: $response');
    print('statuscode: ${response.statusCode}');

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body.toString());
      print('data:$data');
      print('Successfully added to cart');
      return "Successful";
    } else {
      return 'failed';
    }
    // } catch (e) {
    //   return e.toString();
    // }
  }

  Future<CartList> getUserCart() async {
    String userId = await getUserid();
    final response = await http.get(Uri.parse('$baseUrl/carts/user/$userId'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      print('data:=$data');

      return CartList.fromJson(data);
    } else {
      throw Exception('Cannot get cart items');
    }
  }
}
