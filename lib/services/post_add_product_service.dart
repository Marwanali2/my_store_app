import 'package:my_store_app/helper/api.dart';

import '../models/product_model.dart';

class AddProductService {
  Future<ProductModel> postAddProduct({
    required String title,
    required String price,
    required String description,
    required String category,
    required String image,
  }) async {
    Map<String, dynamic> data = await Api().post(
      subLink: 'products',
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
