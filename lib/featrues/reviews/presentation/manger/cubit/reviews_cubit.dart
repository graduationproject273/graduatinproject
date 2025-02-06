// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:gradution/core/connection/network_info.dart';
import 'package:gradution/core/databases/api/dio_consumer.dart';
import 'package:gradution/core/databases/cache/cache_helper.dart';
import 'package:gradution/featrues/reviews/data/datasourse/review_data_sourse_local.dart';
import 'package:gradution/featrues/reviews/data/datasourse/review_data_sourse_remote.dart';
import 'package:gradution/featrues/reviews/data/repository/review_repository_impil.dart';
import 'package:gradution/featrues/reviews/domein/entities/review_entitiy.dart';
import 'package:gradution/featrues/reviews/domein/usecase/get_review.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  ReviewsCubit() : super(ReviewsInitial());
  getReview() async {
    final response = await GetReview(reviewRepository: ReviewRepositoryImpil(networkInfo: NetworkInfoImpl(DataConnectionChecker()), local: ReviewDataSourseLocal(cache: CacheHelper()), reviewDataSourseRemote: ReviewDataSourseRemote(apiConsumer: DioConsumer(dio: Dio())))
          ).call();

    response.fold((failure) {
      emit(ReviewsFailure( errorMessage: failure.errMessage));
    }, (data) {
      emit(ReviewsSeccess(reviewList: data));
    });
  }
}
