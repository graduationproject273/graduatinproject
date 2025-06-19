import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:gradution/core/connection/network_info.dart';
import 'package:gradution/core/databases/api/dio_consumer.dart';
import 'package:gradution/core/databases/cache/cache_helper.dart';
import 'package:gradution/features/authintication/sinup/data/repositries/user_repo_Impl.dart';
import 'package:gradution/features/authintication/sinup/domain/repositries/signup_repositry.dart';
import 'package:gradution/features/cart/data/repositries/cart_repositry_Impl.dart';
import 'package:gradution/features/cart/domain/repositries/cart_repositry.dart';
import 'package:gradution/features/cart/domain/usecases/cart_usecase.dart';
import 'package:gradution/features/cart/presentation/cubits/cubit/cart_cubit.dart';
import 'package:gradution/features/home/data/repostries/user_profile_repo_Impl.dart';
import 'package:gradution/features/home/domain/repositries/user_profile_repo.dart';
import 'package:gradution/features/home/domain/usecases/user_profile_usecase.dart';
import 'package:gradution/features/home/presentation/cubit/cubit/userprofile_cubit.dart';
import 'package:gradution/features/orders/data/datasources/order_data_sourse_local.dart';
import 'package:gradution/features/orders/data/datasources/order_data_sourse_remote.dart';
import 'package:gradution/features/orders/data/repositories/order_repositry_impli.dart';
import 'package:gradution/features/orders/domain/repositories/order_repositry.dart';
import 'package:gradution/features/orders/domain/usecases/get_all_order.dart';
import 'package:gradution/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:gradution/features/products/data/datasource/product_data_sourse_local.dart';
import 'package:gradution/features/products/data/datasource/product_data_sourse_remote.dart';
import 'package:gradution/features/products/data/repositories/product_repositry_impli.dart';
import 'package:gradution/features/products/domain/repositries/products_repositry.dart';
import 'package:gradution/features/products/domain/usecases/get_all_product.dart';
import 'package:gradution/features/products/presentation/cubits/products_cubit/cubit/products_cubit.dart';
import 'package:gradution/features/sellerDashboard/data/datasources/get_all_category_datasourse_local.dart';
import 'package:gradution/features/sellerDashboard/data/datasources/get_all_category_datasourse_remote.dart';
import 'package:gradution/features/sellerDashboard/data/repositries/seller_repositry_impl.dart';
import 'package:gradution/features/sellerDashboard/domain/repositries/seller_repositry.dart';
import 'package:gradution/features/sellerDashboard/domain/usecases/addproduct_usecase.dart';
import 'package:gradution/features/sellerDashboard/domain/usecases/get_all_category.dart';
import 'package:gradution/features/sellerDashboard/domain/usecases/profile_usecase.dart';
import 'package:gradution/features/sellerDashboard/presentation/cubit/add_product_cubit/add_product_cubit.dart';
import 'package:gradution/features/sellerDashboard/presentation/cubit/cubit/get_product_seller_cubit.dart';
import 'package:gradution/features/authintication/sinup/domain/usecases/login_usecase.dart';
import 'package:gradution/features/authintication/sinup/domain/usecases/seller_usecase.dart';
import 'package:gradution/features/authintication/sinup/domain/usecases/signup_seller.dart';
import 'package:gradution/features/authintication/sinup/presentation/cubit/seller_cubit/cubit/seller_cubit.dart';
import 'package:gradution/features/authintication/sinup/presentation/cubit/user_cubit/sinup_cubit.dart';
import 'package:gradution/features/sellerDashboard/presentation/cubit/edit_product_cubit/edit_product_seller_cubit.dart';
import 'package:gradution/features/sellerDashboard/presentation/cubit/get_all_category_cubit/get_all_category_cubit.dart';
import 'package:gradution/features/sellerDashboard/presentation/cubit/profile/profile_cubit.dart'; // تأكد من مسار DioConsumer

final sl = GetIt.instance;

void setup() {
  // Dependencies
  sl.registerLazySingleton<DioConsumer>(() => DioConsumer(dio: Dio()));
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(DataConnectionChecker()));
//

  sl.registerLazySingleton<ProductDataSourseLocal>(
      () => ProductDataSourseLocal(cache: CacheHelper()));
  sl.registerLazySingleton<ProductDataSourseRemote>(
      () => ProductDataSourseRemote(apiConsumer: sl<DioConsumer>()));

  sl.registerLazySingleton<GetAllCategoryDatasourseLocal>(
      () => GetAllCategoryDatasourseLocal(cache: CacheHelper()));
  sl.registerLazySingleton<GetAllCategoryDatasourseRemote>(
      () => GetAllCategoryDatasourseRemote(dioConsumer: sl()));

       sl.registerLazySingleton<OrderDataSourseLocal>(
      () => OrderDataSourseLocal(cache: CacheHelper()));
  sl.registerLazySingleton<OrderDataSourseRemote>(
      () => OrderDataSourseRemote( sl()));

  ///S
  ///
  // Repository
  sl.registerLazySingleton<ProductsRepositry>(() => ProductRepositryImpli(
      networkInfo: sl(),
      productDataSourseLocal: sl(),
      productDataSourseRemote: sl()));
  sl.registerLazySingleton<SignupRepositry>(() => UserRepoImpl(sl()));
   sl.registerLazySingleton<CartRepositry>(() => CartRepositryImpl(dioConsumer:  sl()));
      sl.registerLazySingleton<OrderRepositry>(() => OrderRepositoryImpl(localDataSource:  sl(), remoteDataSource:  sl(),networkInfo: NetworkInfoImpl(DataConnectionChecker())));
     sl.registerLazySingleton<UserProfileRepo>(() => UserProfileRepoImpl(dioConsumer:  sl()));
  sl.registerLazySingleton<SellerRepositry>(
      () => SellerRepositryImpl(sl(), sl(), sl(), sl()));

  // Usecase
  sl.registerLazySingleton(() => GetAllCategory(productsRepositry: sl()));
  sl.registerLazySingleton(() => GetAllProduct(repository: sl()));
  sl.registerLazySingleton(() => CartUseCase(cartRepositry: sl()));
  sl.registerLazySingleton(() => ProfileUsecase( sl()));
  sl.registerLazySingleton(() => UserProfileUsecase( sl()));
   sl.registerLazySingleton(() => GetAllOrder( sl()));

  sl.registerLazySingleton(() => AddproductUsecase(productsRepositry: sl()));

  // Cubit
  sl.registerLazySingleton(() => AddProductCubit(
        addproductUsecase: sl(),
      ));

  sl.registerLazySingleton(() => SellerUsecase(signupRepositry: sl()));
  sl.registerLazySingleton(() => SignupSellerUsecase(sl()));
  sl.registerLazySingleton(() => LoginUsecase(sl()));
    sl.registerLazySingleton(() => EditProductSellerCubit(sl()));

  sl.registerLazySingleton(() => GetProductSellerCubit(sl(), sl()));
  sl.registerLazySingleton(() => GetAllCategoryCubit(sl<GetAllCategory>()));
  sl.registerFactory(() => SinupCubit(sl(), sl()));
  sl.registerFactory(() => SellerCubit(sl()));

  sl.registerFactory(() => CartCubit(
        sl(),
      ));
  sl.registerLazySingleton(() => ProductsCubit(sl()));

  sl.registerFactory(() => ProfileCubit(sl()));
 sl.registerFactory(() => UserprofileCubit(sl()));
 sl.registerFactory(() => OrdersCubit(sl()));

  
}
