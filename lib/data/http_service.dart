import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService {
  static const String url = "https://fakestoreapi.com/auth/login";

  Future login(String username, String password) async {
    try {
      final response = await http.post(Uri.parse(url),
          body: {'username': username, 'password': password});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('Login successfully');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
