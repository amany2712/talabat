import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:talabat/models/product.dart';
import 'package:talabat/models/products.dart';


class ProductApi {
  Future<List <Product>> getProduct()async{
    try{
      http.Response response = await http.get(Uri.parse("https://dummyjson.com/products"));
      if (response.statusCode ==200){
        String data = response.body;
        var jsonData =jsonDecode(data);

        Products products = Products.fromJson(jsonData);

        return products.products ?? [];
      }else{
        return [];
      }

    }catch(e){
      print(e);
      return [];
    }
  
  }
}