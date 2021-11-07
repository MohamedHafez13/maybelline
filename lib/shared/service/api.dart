import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:maybelline/models/product_model.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>> fetchProducts() async {
    var response = await client.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
    var jsonString = response.body;
    return productFromJson(jsonString);
  }

  static Future<List<Product>> search({required String productType }) async {
    var response = await client.get(Uri.parse(
        'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline&product_type=$productType'));
    var jsonString = response.body;
    return productFromJson(jsonString);
  }

}
