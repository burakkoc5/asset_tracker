import 'package:asset_tracker/features/auth/application/authentication_cubit.dart';
import 'package:asset_tracker/features/auth/infrastructure/abstract/authentication_repository.dart';
import 'package:asset_tracker/features/auth/infrastructure/concrete/firebase_auth_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // Register services
  getIt.registerSingleton<AuthenticationRepository>(FirebaseAuthRepository());

  // Register bloc
  getIt.registerFactory<AuthenticationCubit>(
      () => AuthenticationCubit(getIt<AuthenticationRepository>()));
}
