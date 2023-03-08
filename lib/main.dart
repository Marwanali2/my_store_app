import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:my_store_app/screens/home_page.dart';
import 'package:my_store_app/screens/update_product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store App',

      routes: {
       HomePage.id:(context) => HomePage(),
        UpdateProductPage.id:(context) => UpdateProductPage(),
      },
      initialRoute: HomePage.id,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

    );
  }
}
