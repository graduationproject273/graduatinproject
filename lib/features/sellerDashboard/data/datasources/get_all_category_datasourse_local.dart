import 'dart:convert';

import 'package:gradution/core/databases/cache/cache_helper.dart';
import 'package:gradution/core/errors/expentions.dart';
import 'package:gradution/features/sellerDashboard/data/models/get_all_category_model.dart';

class GetAllCategoryDatasourseLocal {
  final CacheHelper cache;
  final String keys = "Caczkeggggr";
  GetAllCategoryDatasourseLocal({required this.cache});

  cacheCategory(List<GetAllCategoryModel>? cached) {
    if (cached != null) {
      cache.saveData(
        key:keys,
        value: json.encode(
          cached.map((cached)=>cached.toJson()).toList(),
        ),
      );
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }

  Future<List<GetAllCategoryModel>> getCatergoryLocal( ) {
    final jsonString = cache.getDataString(key:keys);

    if (jsonString != null) {
  final List<dynamic> decodedJson = json.decode(jsonString);
    final List<GetAllCategoryModel> list = decodedJson.map((jsonItem) => GetAllCategoryModel.fromJson(jsonItem)).toList();

      return Future.value(list);
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }
}