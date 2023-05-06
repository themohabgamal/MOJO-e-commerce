import 'dart:convert';

import 'package:e_commerce/models/category_response_model.dart';
import 'package:http/http.dart' as http;

class HomeCategoryRepo {
  static Future<List<CategoryResponseModel>?> getSpeceficCategory(
      String category) {
    return http
        .get(
            Uri.parse('https://fakestoreapi.com/products/category/${category}'))
        .then((data) {
      final products = <CategoryResponseModel>[];
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        for (var product in jsonData) {
          products.add(CategoryResponseModel.fromJson(product));
          print(products);
        }
        return products;
      }
    }).catchError((error) => print(error));
    // var url =
    //     Uri.parse('https://fakestoreapi.com/products/category/${category}');
    // var response = await http.get(url);
    // if (response.statusCode == 200) {
    //   print("success");
    //   var jsonData = jsonDecode(response.body);
    //   return CategoryResponseModel.fromJson(jsonData);
    // } else {
    //   throw "error";
    // }
  }
}
