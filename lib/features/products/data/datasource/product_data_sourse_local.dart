import 'dart:convert';

import 'package:gradution/core/databases/cache/cache_helper.dart';
import 'package:gradution/core/errors/expentions.dart';
import 'package:gradution/features/products/data/model/product_model.dart';



class ProductDataSourseLocal {
  final CacheHelper cache;
  final String keys = "CachedProduct";
  ProductDataSourseLocal({required this.cache});

  cacheproduct(List<ProductModel>? productToCache, String key) {
    if (productToCache != null) {
      cache.saveData(
        key:keys+key,
        value: json.encode(
          productToCache.map((product)=>product.toJson()).toList(),
        ),
      );
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }

 Future<List<ProductModel>> getLastProduct(String key) {
  final jsonString = cache.getDataString(key: keys + key);

  if (jsonString != null) {
    final List<dynamic> decodedJson = json.decode(jsonString);
    
    // نحتفظ بأول 4 فقط (أو أقل إن لم يوجد 4)
    final limitedJson = decodedJson.take(4).toList();

    final List<ProductModel> productList = 
      limitedJson.map((jsonItem) => ProductModel.fromJson(jsonItem)).toList();

    return Future.value(productList);
  } else {
    throw CacheExeption(errorMessage: "No Internet Connection");
  }
}
}
