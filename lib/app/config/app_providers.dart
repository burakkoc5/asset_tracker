import 'package:asset_tracker/core/utils/setup_locator.dart';
import 'package:asset_tracker/features/auth/application/authentication_cubit.dart';
import 'package:asset_tracker/features/user_asset/application/user_asset_cubit.dart';
import 'package:asset_tracker/features/websocket/application/socket_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// AppProviders is a class that provides a list of providers that can be used in the app.
class AppProviders {
  static List<BlocProvider> getProviders() {
    return [
      BlocProvider<AuthenticationCubit>(
        create: (context) => getIt<AuthenticationCubit>(),
      ),

      BlocProvider<SocketCubit>(
        create: (context) => getIt<SocketCubit>(),
      ),

      BlocProvider<UserAssetCubit>(
        create: (context) => getIt<UserAssetCubit>(),
      ),
      // Other providers can be added here
    ];
  }
}
