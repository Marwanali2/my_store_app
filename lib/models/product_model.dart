import 'package:my_store_app/models/rating_model.dart';

class ProductModel {
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String image;
  final String category;
  final RatingModel? ratingModel;
  // فيه متغير اسمه rating نوعه map مينفعش نعمله هنا فمفروض نروح نعمله model لوحده يعني اي ماب هيكون ليها موديل خاص بيها


  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.ratingModel,
  });

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: jsonData['price'],
      description: jsonData['description'],
      category: jsonData['category'],
      image: jsonData['image'],
      ratingModel: jsonData['rating']==null?null:RatingModel.fromJson(jsonData['rating']),
    );
  }
}
