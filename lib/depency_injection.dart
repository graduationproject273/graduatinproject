import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:gradution/core/databases/api/dio_consumer.dart';
import 'package:gradution/features/authintication/sinup/data/repositries/user_repo_Impl.dart';
import 'package:gradution/features/authintication/sinup/domain/repositries/signup_repositry.dart';
import 'package:gradution/features/authintication/sinup/domain/usecases/signup_usecase.dart';
import 'package:gradution/features/authintication/sinup/presentation/cubit/sinup_cubit.dart';
import 'package:gradution/features/sellerDashboard/presentation/cubit/sellerdashboard_cubit.dart'; // تأكد من مسار DioConsumer

final sl = GetIt.instance;

void setup() {
  // Dependencies
  sl.registerLazySingleton<DioConsumer>(() => DioConsumer(dio: Dio()));

  // Repository
  sl.registerLazySingleton<SignupRepositry>(() => UserRepoImpl(sl()));

  // Usecase
  sl.registerLazySingleton(() => SignupUsecase(sl()));

  // Cubit
  sl.registerLazySingleton(() => SinupCubit(sl()));
    sl.registerLazySingleton(() => SellerdashboardCubit());

}
