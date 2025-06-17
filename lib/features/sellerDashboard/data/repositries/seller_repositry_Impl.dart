import 'package:gradution/core/databases/api/dio_consumer.dart';
import 'package:gradution/core/databases/api/end_points.dart';
import 'package:gradution/core/errors/expentions.dart';
import 'package:gradution/core/errors/failure.dart';
import 'package:gradution/features/sellerDashboard/data/datasources/get_all_category_datasourse_local.dart';
import 'package:gradution/features/sellerDashboard/data/datasources/get_all_category_datasourse_remote.dart';
import 'package:gradution/features/sellerDashboard/data/models/add_product_model.dart';
import 'package:gradution/features/sellerDashboard/data/models/get_all_category_model.dart';
import 'package:gradution/features/sellerDashboard/data/models/seller_model.dart';
import 'package:gradution/features/sellerDashboard/domain/entities/add_product_entity.dart';
import 'package:gradution/features/sellerDashboard/domain/entities/seller_entity.dart';
import 'package:gradution/features/sellerDashboard/domain/repositries/seller_repositry.dart';

class SellerRepositryImpl extends SellerRepositry {
  final DioConsumer dioConsumer;
    final NetworkInfo networkInfo;

  final GetAllCategoryDatasourseRemote remote;
  final GetAllCategoryDatasourseLocal local ;

  SellerRepositryImpl(this.dioConsumer, this.remote, this.local, this.networkInfo);

  @override
  Future<void> addSeller(SellerEntity sellerEntity) async {
    final sellerModel = SellerModel(
      name: sellerEntity.name,
      mobile: sellerEntity.mobile,
      mail: sellerEntity.mail,
      bankAccountNumber: sellerEntity.bankAccountNumber,
      bankAccountHolderName: sellerEntity.bankAccountHolderName,
      TIN: sellerEntity.TIN,
      swiftCode: sellerEntity.swiftCode,
      logo: sellerEntity.logo,
      banner: sellerEntity.banner,
      addresses: sellerEntity.addresses,
    );

    await dioConsumer.post(
      path: EndPoints.sellerUrl,
      data: sellerModel.toJson(), 
    );
  }
}
