  import 'package:dartz/dartz.dart';
import 'package:gradution/core/connection/network_info.dart';
import 'package:gradution/core/errors/expentions.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/reviews/data/datasourse/review_data_sourse_local.dart';
import 'package:gradution/features/reviews/data/datasourse/review_data_sourse_remote.dart';
import 'package:gradution/features/reviews/domein/entities/review_entitiy.dart';
import 'package:gradution/features/reviews/domein/repository/review_repository.dart';

@override
  class ReviewRepositoryImpil implements ReviewRepository {
   final ReviewDataSourseRemote reviewDataSourseRemote;
     final NetworkInfo networkInfo;
     final ReviewDataSourseLocal local;


  ReviewRepositoryImpil({required this.networkInfo,required this.local, required this.reviewDataSourseRemote});
  @override
  
  Future<Either<Failure, List<ReviewEntitiy>>> getReview() async {
    if (await networkInfo.isConnected!) {
      try {
        final response = await reviewDataSourseRemote.getReview();
        local.cacheUser(response);
        return Right(response);
      }on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    }else {
        try {
  final localUser = await local.getLastReviews();
  return right(localUser);
}  on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    }

    
  }}