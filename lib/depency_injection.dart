import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:gradution/core/connection/network_info.dart';
import 'package:gradution/core/databases/api/dio_consumer.dart';
import 'package:gradution/core/databases/cache/cache_helper.dart';
import 'package:gradution/features/authintication/sinup/data/repositries/user_repo_Impl.dart';
import 'package:gradution/features/authintication/sinup/domain/repositries/signup_repositry.dart';
import 'package:gradution/features/authintication/sinup/domain/usecases/signup_usecase.dart';
import 'package:gradution/features/sellerDashboard/presentation/cubit/sellerdashboard_cubit.dart'; // تأكد من مسار DioConsumer
import 'package:gradution/features/authintication/sinup/presentation/cubit/user_cubit/sinup_cubit.dart'; // تأكد من مسار DioConsumer

final sl = GetIt.instance;

void setup() {
  // Dependencies
  sl.registerLazySingleton<DioConsumer>(() => DioConsumer(dio: Dio()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(DataConnectionChecker()));
//
  sl.registerLazySingleton<GetAllCategoryDatasourseLocal>(() => GetAllCategoryDatasourseLocal(cache: CacheHelper()));
  sl.registerLazySingleton<GetAllCategoryDatasourseRemote>(() => GetAllCategoryDatasourseRemote(dioConsumer: sl()));

///S
///
  // Repository
  sl.registerLazySingleton<SignupRepositry>(() => UserRepoImpl(sl()));
    sl.registerLazySingleton<SellerRepositry>(() => SellerRepositryImpl(sl(),sl(),sl(),sl()));


  // Usecase
  sl.registerLazySingleton(() => SignupUsecase(sl()));

  // Cubit
  sl.registerLazySingleton(() => SinupCubit(sl()));
    sl.registerLazySingleton(() => SellerdashboardCubit());

}
