import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tager/core/entity/product_entity.dart';
import 'package:tager/core/repos/get_product_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.getProductRepo) : super(ProductInitial());

  final GetProductRepo getProductRepo;
  Future<void> getProducts() async {
    emit(ProductLoading());
    var result = await getProductRepo.getProducts();
    result.fold(
      (failure) {
        emit(ProductFailure(message: failure.message));
      },
      (products) {
        emit(ProductSuccess(products: products));
      },
    );
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductLoading());
    var result = await getProductRepo.getBestSellingProducts();
    result.fold(
      (failure) {
        emit(ProductFailure(message: failure.message));
      },
      (products) {
        emit(ProductSuccess(products: products));
      },
    );
  }
}
