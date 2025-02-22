import 'package:asset_tracker/features/auth/application/authentication_cubit.dart';
import 'package:asset_tracker/features/auth/infrastructure/abstract/authentication_repository.dart';
import 'package:asset_tracker/features/auth/infrastructure/concrete/firebase_auth_repository.dart';
import 'package:asset_tracker/features/auth/infrastructure/concrete/mock_auth_repository.dart';
import 'package:asset_tracker/features/websocket/application/socket_cubit.dart';
import 'package:asset_tracker/features/websocket/domain/price_changed_data_model.dart';
import 'package:asset_tracker/features/websocket/infrastructure/socket_repository.dart';
import 'package:asset_tracker/features/websocket/infrastructure/socket_repository_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // Register services
  getIt.registerSingleton<AuthenticationRepository>(MockAuthRepositoryImpl());

  getIt.registerFactory<AuthenticationCubit>(
      () => AuthenticationCubit(getIt<AuthenticationRepository>()));

  getIt.registerSingleton<SocketRepository<PriceChangedDataModel>>(
      SocketRepositoryImpl<PriceChangedDataModel>(
          socketName: 'HAREM_SOCKET_URL'));

  getIt.registerFactory<SocketCubit>(() => SocketCubit(
      socketRepository: getIt<SocketRepository<PriceChangedDataModel>>()));
}
