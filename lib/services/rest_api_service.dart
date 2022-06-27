import 'package:http/http.dart' as http;

class RestApiService {
  static const String _baseUrl =
      'https://api.nomics.com/v1/currencies/ticker?key=4c3e49cfd9f9ba4a1542291f99bab86b042f1f1a';

  static Future<http.Response> getAllCryptoCurrencies() async {
    return await http.get(Uri.parse(_baseUrl));
  }
}
