import 'package:get_it/get_it.dart';
import 'package:tager/core/repos/get_product_repo.dart';
import 'package:tager/core/repos/get_product_repo_impt.dart';
import 'package:tager/core/servies/data_base_servies.dart';
import 'package:tager/core/servies/firebase_auth_serviecs.dart';
import 'package:tager/core/servies/firestore_services.dart';
import 'package:tager/feature/auth_feature/data/repos/auth_repo_impl.dart';
import 'package:tager/feature/auth_feature/domain/repos/auth_repo.dart';

// This is our global ServiceLocator
GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  // Here we can register all our singleton services

  getIt.registerSingleton<FirebaseAuthServiecs>(FirebaseAuthServiecs());
  getIt.registerSingleton<DataBaseServies>(FireStoreServices());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(getIt<FirebaseAuthServiecs>(), getIt.get<DataBaseServies>()),
  );
  getIt.registerSingleton<GetProductRepo>(
    GetProductRFepoImpt(getIt.get<DataBaseServies>()),
  );

  // getIt.registerSingleton<AuthRepoImpl>(
  //   AuthRepoImpl(getIt.get<FirebaseAuthServiecs>()),
  // );
}
