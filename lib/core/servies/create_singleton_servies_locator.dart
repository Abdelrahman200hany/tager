import 'package:get_it/get_it.dart';
import 'package:tager/core/servies/firebase_auth_serviecs.dart';
import 'package:tager/core/servies/firestore_services.dart';
import 'package:tager/feature/auth_feature/data/repos/auth_repo_impl.dart';

// This is our global ServiceLocator
GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  // Here we can register all our singleton services

  getIt.registerSingleton<FirebaseAuthServiecs>(FirebaseAuthServiecs());
  getIt.registerSingleton<FireStoreServices>(FireStoreServices());
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(getIt<FirebaseAuthServiecs>(), getIt.get<FireStoreServices>()),
  );
  // getIt.registerSingleton<AuthRepoImpl>(
  //   AuthRepoImpl(getIt.get<FirebaseAuthServiecs>()),
  // );
}
