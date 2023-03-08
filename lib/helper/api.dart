import 'dart:convert';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String subLink}) async {
    String baseurl = 'https://fakestoreapi.com';
    Uri url = Uri.parse('$baseurl/$subLink');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there\'s problem in get method with status code : ${response.statusCode} with body : ${response.body}');
    }
  }

//post method *********************************
  Future<dynamic> post({
    required String subLink,
    @required dynamic body,
    @required String? Token,
  }) async {
    String baseurl = 'https://fakestoreapi.com';
    Uri url = Uri.parse('$baseurl/$subLink');
    Map<String, String> headers = {};
    if (Token != null) {
      headers.addAll({
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer $Token'
      });
    }
    http.Response response = await http.post(url, body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'there\'s problem in post method with status code : ${response.statusCode} with body ${response.body}');
    }
  }

  //put method *********************************
  Future<dynamic> put({
    required String subLink,
    @required dynamic body,
    @required String? Token,
  }) async {
    String baseurl = 'https://fakestoreapi.com';
    Uri url = Uri.parse('$baseurl/$subLink');
    Map<String, String> headers = {};
    headers.addAll(
      {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );
    if (Token != null) {
      headers.addAll({'Authorization': 'Bearer $Token'});
    }

    print('url is $url *** body is $body *** token is $Token');

    http.Response response = await http.post(url, body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      return data;

    } else {
      throw Exception(
          'there\'s problem in put method with status code : ${response.statusCode} with body ${response.body}');
    }
  }
}
