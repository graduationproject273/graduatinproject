import 'dart:convert';

import 'package:gradution/core/databases/cache/cache_helper.dart';
import 'package:gradution/core/errors/expentions.dart';
import 'package:gradution/featrues/reviews/data/model/review_model.dart';

class ReviewDataSourseLocal {
  final CacheHelper cache;
  final String key = "CachedReview";
  ReviewDataSourseLocal({required this.cache});

  cacheUser(List<ReviewModel>?  reviewToCache) {
    if (reviewToCache != null) {
      cache.saveData(
        key: key,
        value: json.encode(
          reviewToCache.map((review) => review.toJson()).toList(),
        ),
      );
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }

  Future<List< ReviewModel>> getLastReviews() {
    final jsonString = cache.getDataString(key: key);

    if (jsonString != null) {
      final List<dynamic> decodedJson = json.decode(jsonString);
      return Future.value(decodedJson.map((jsonItem) => ReviewModel.fromJson(jsonItem)).toList());
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }
}
