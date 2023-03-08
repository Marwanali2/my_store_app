import 'package:flutter/cupertino.dart';

import '../helper/api.dart';
import '../models/product_model.dart';
//https://fakestoreapi.com/products/:id
class UpdateProductService{
  Future<ProductModel> updateProduct({
    required String title,
    required String price,
    required String description,
    required String?category,
    required String image,
    required int id,
  }) async {
    print('id is $id');
    Map<String, dynamic> data = await Api().put(
      subLink: 'products/$id',
      body: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      },
    );
    return ProductModel.fromJson(data);
  }
}