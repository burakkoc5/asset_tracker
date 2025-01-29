import 'package:asset_tracker/features/auth/application/authentication_cubit.dart';
import 'package:asset_tracker/features/auth/infrastructure/abstract/authentication_repository.dart';
import 'package:asset_tracker/features/auth/infrastructure/concrete/firebase_auth_repository.dart';
import 'package:asset_tracker/features/websocket/application/socket_cubit.dart';
import 'package:asset_tracker/features/websocket/domain/price_changed_data_model.dart';
import 'package:asset_tracker/features/websocket/infrastructure/socket_repository.dart';
import 'package:asset_tracker/features/websocket/infrastructure/socket_repository_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // Register services
  print('Registering AuthenticationRepository...');
  getIt.registerSingleton<AuthenticationRepository>(
      FirebaseAuthRepositoryImpl());

  print('Registering AuthenticationCubit...');
  getIt.registerFactory<AuthenticationCubit>(
      () => AuthenticationCubit(getIt<AuthenticationRepository>()));

  print('Registering SocketRepository...');
  getIt.registerSingleton<SocketRepository<PriceChangedDataModel>>(
      SocketRepositoryImpl<PriceChangedDataModel>(
          socketName: 'HAREM_SOCKET_URL'));

  print('Registering SocketCubit...');
  getIt.registerFactory<SocketCubit>(() => SocketCubit(
      socketRepository: getIt<SocketRepository<PriceChangedDataModel>>()));

  print('GetIt setup completed.');
}
