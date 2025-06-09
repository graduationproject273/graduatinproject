import 'dart:convert';

import 'package:gradution/core/databases/cache/cache_helper.dart';
import 'package:gradution/core/errors/expentions.dart';
import 'package:gradution/features/orders/data/models/order_model.dart';



class OrderDataSourseLocal {
  final CacheHelper cache;
  final String keys = "Cachedorder";
OrderDataSourseLocal  ({required this.cache});

  cachedOrder(List<OrderModel>? cached, String key) {
    if (cached != null) {
      cache.saveData(
        key:keys+key,
        value: json.encode(
          cached.map((data)=>data.toJson()).toList(),
        ),
      );
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }

 Future<List<OrderModel>> getLastOrder(String key) {
  final jsonString = cache.getDataString(key: keys + key);

  if (jsonString != null) {
    final List<dynamic> decodedJson = json.decode(jsonString);
    
    // نحتفظ بأول 4 فقط (أو أقل إن لم يوجد 4)
    final limitedJson = decodedJson.take(4).toList();

    final List<OrderModel> data = 
      limitedJson.map((jsonItem) => OrderModel.fromJson(jsonItem)).toList();

    return Future.value(data);
  } else {
    throw CacheExeption(errorMessage: "No Internet Connection");
  }
}
}
