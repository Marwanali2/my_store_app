import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:drop_shadow/drop_shadow.dart';

import '../models/product_model.dart';
import '../services/get_all_products_service.dart';
import '../widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  static String id = 'HomePage';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('New Trend', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(FontAwesomeIcons.cartShopping, color: Colors.black)),
        ],
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: AllProductsService().getAllProducts(),
        builder: (context, snapshot) {
          List<ProductModel>? products = snapshot.data;
          if (snapshot.hasData) {
            return GridView.builder(
              itemCount: products?.length,
              padding: EdgeInsets.symmetric(vertical: 60),
              clipBehavior: Clip.none,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // عدد الاعمدة
                //  maxCrossAxisExtent: 200, // عرض الويدجت
                childAspectRatio: 1, // ارتفاع الويدجت (نسبة العرض الي الطول)
                crossAxisSpacing: 1, // المسافة العرضية بين كل ويدجت
                mainAxisSpacing: 35, // المسافة الطولية بين كل ويدجت
              ),
              itemBuilder: (context, index) {
                return CustomCard(product: products![index],);
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
