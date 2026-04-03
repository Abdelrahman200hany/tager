import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:tager/core/entity/product_entity.dart';
import 'package:tager/core/models/product_model.dart';
import 'package:tager/core/repos/get_product_repo.dart';
import 'package:tager/core/servies/data_base_servies.dart';
import 'package:tager/errors/failure.dart';

class GetProductRFepoImpt implements GetProductRepo {
  final DataBaseServies dataBaseServies;

  GetProductRFepoImpt(this.dataBaseServies);
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data =
          await dataBaseServies.readData(
                path: 'products',
                query: {
                  'limit': 10,
                  'descending': true,
                  'orderBy': 'sellingCount',
                },
              )
              as List<Map<String, dynamic>>;
      List<ProductEntity> products = data
          // every map as object  convert to model then convert the model to entity
          .map((e) => ProductModel.fromjson(e).toEntity())
          .toList();
      return Right(products);
    } catch (e) {
      log(
        'the expection is in getBestSellingProducts in get Product Repo implt is  $e',
      );
      return Left(ServerFailure(message: 'فشل في جلب المنتجات'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data =
          await dataBaseServies.readData(path: 'products')
              as List<Map<String, dynamic>>;
      List<ProductEntity> products = data
          // every map as object  convert to model then convert the model to entity
          .map((e) => ProductModel.fromjson(e).toEntity())
          .toList();
      return Right(products);
    } catch (e) {
      log('the expection is in getProducts in get Product Repo implt is  $e');
      return Left(ServerFailure(message: 'فشل في جلب المنتجات'));
    }
  }
}
