import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:my_store_app/models/product_model.dart';

import '../services/put_update_service.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({Key? key}) : super(key: key);

  static String id = 'UpdateProductPage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, productDesc, productImageUrl, productPrice;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text('Update Product', style: TextStyle(color: Colors.black)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              CustomTextField(
                hintText: 'Product Name',
                label: 'Enter Product Name',
                keyboardType: TextInputType.text,
                onChanged: (data) => productName = data,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                hintText: 'Product Description',
                label: 'Enter Product Description',
                keyboardType: TextInputType.text,
                onChanged: (data) => productDesc = data,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                hintText: 'Product Image',
                label: 'Enter Product image Url',
                keyboardType: TextInputType.url,
                onChanged: (data) => productImageUrl = data,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                hintText: 'Product Price',
                label: 'Enter Product Price',
                keyboardType: TextInputType.text,
                onChanged: (data) => productPrice = data,
              ),
              Spacer(),
              CustomButton(
                onPressed: () async{
                  isLoading = true;
                  setState(() {});
                  try {
                   await updateProduct(product);
                    print('success');
                  } on Exception catch (e) {
                    print(e.toString());
                  }
                  isLoading = false;
                  setState(() {});
                },
                text: 'Update',
              ),
            ],
          ),
        ),
      ),
    );
  }



  Future<void> updateProduct(ProductModel product) async{
  await  UpdateProductService().updateProduct(
        title: productName==null?product.title:productName!,
        price: productPrice==null?product.price.toString():productPrice!,
        description: productDesc==null?product.description:productDesc!,
        image: productImageUrl==null?product.image:productImageUrl!,
        id:product.id,
        category: product.category);
  }
}
