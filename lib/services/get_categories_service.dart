import 'dart:convert';

import '../helper/api.dart';
import '../models/product_model.dart';
import 'package:http/http.dart' as http;



class CategoriesService{

  Future<List<ProductModel>> getCategories({required String categoryName}) async {
    //String baseurl = 'https://fakestoreapi.com';
    //Uri url = Uri.parse('$baseurl/products/category/$categoryName');
   // http.Response response = await http.get(url);

    List<dynamic> data =await Api().get(subLink: 'products/category/$categoryName');


      List<ProductModel> categoriesList = [];
      for (int i = 0; i < data.length; i++) {
        categoriesList.add(
          ProductModel.fromJson(data[i]),
        );
      }
      return categoriesList;




  }

}