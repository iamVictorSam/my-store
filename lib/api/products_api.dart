import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_store/api/base.dart';
import 'package:my_store/model/product_model.dart';

class ProductApi {
  Future<List<Products>> getAllProducts() async {
    final url = Uri.parse('${Base.baseUrl}/store/products');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        var data = result['products'];

        return List<Products>.from(data.map((x) => Products.fromJson(x)));
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
    }
    throw 'error';
  }
}
