import 'package:flutter/material.dart';
import 'package:my_store_app/models/product_model.dart';

import '../screens/update_product_page.dart';
class CustomCard extends StatelessWidget {
  ProductModel product;
   CustomCard({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: (){
       Navigator.pushNamed(context, UpdateProductPage.id,arguments: product);
     },
      child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              width: 205,
              height: 180,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 50,
                  offset: Offset(10, 10),
                ),
              ]),
              child: Card(
                elevation: 10,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${product.title}'.substring(0,18),
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      //SizedBox(height: 2,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${product.price}'r' $'),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              child: Image.network(
                '${product.image}',
                height: 120,
                width: 100,
              ),
              bottom: 130,
              right: 25,
            )
          ]),
    );
  }
}