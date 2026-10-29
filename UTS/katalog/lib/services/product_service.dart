import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductService {
  static const String baseUrl =
      'https://dummyjson.com/products?limit=100';

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
      jsonDecode(response.body) as Map<String, dynamic>;

      final List<dynamic> productsJson =
      data['products'] as List<dynamic>;

      return productsJson
          .map((item) => Product.fromJson(
        item as Map<String, dynamic>,
      ))
          .toList();
    } else {
      throw Exception(
        'Failed to load products. Status code: ${response.statusCode}',
      );
    }
  }
}