import 'package:dartz/dartz.dart';
import 'package:tager/core/entity/product_entity.dart';
import 'package:tager/errors/failure.dart';

abstract class GetProductRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts();
}
