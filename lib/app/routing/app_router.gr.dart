// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:asset_tracker/core/shell/presentation/shell_screen.dart' as _i4;
import 'package:asset_tracker/features/auth/presentation/registration_screen.dart'
    as _i2;
import 'package:asset_tracker/features/home/presentation/home_screen.dart'
    as _i1;
import 'package:asset_tracker/features/settings/presentation/settings_screen.dart'
    as _i3;
import 'package:asset_tracker/features/splash/splash_screen.dart' as _i5;
import 'package:asset_tracker/features/user_asset/presentation/transaction_history_screen.dart'
    as _i6;
import 'package:asset_tracker/features/user_asset/presentation/user_assets_screen.dart'
    as _i7;
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeScreen();
    },
  );
}

/// generated route for
/// [_i2.RegistrationScreen]
class RegistrationRoute extends _i8.PageRouteInfo<void> {
  const RegistrationRoute({List<_i8.PageRouteInfo>? children})
      : super(
          RegistrationRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.RegistrationScreen();
    },
  );
}

/// generated route for
/// [_i3.SettingsScreen]
class SettingsRoute extends _i8.PageRouteInfo<void> {
  const SettingsRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i4.ShellScreen]
class ShellRoute extends _i8.PageRouteInfo<ShellRouteArgs> {
  ShellRoute({
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          ShellRoute.name,
          args: ShellRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ShellRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<ShellRouteArgs>(orElse: () => const ShellRouteArgs());
      return _i4.ShellScreen(key: args.key);
    },
  );
}

class ShellRouteArgs {
  const ShellRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'ShellRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.SplashScreen]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.SplashScreen();
    },
  );
}

/// generated route for
/// [_i6.TransactionHistoryScreen]
class TransactionHistoryRoute extends _i8.PageRouteInfo<void> {
  const TransactionHistoryRoute({List<_i8.PageRouteInfo>? children})
      : super(
          TransactionHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransactionHistoryRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.TransactionHistoryScreen();
    },
  );
}

/// generated route for
/// [_i7.UserAssetsScreen]
class UserAssetsRoute extends _i8.PageRouteInfo<void> {
  const UserAssetsRoute({List<_i8.PageRouteInfo>? children})
      : super(
          UserAssetsRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserAssetsRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i7.UserAssetsScreen();
    },
  );
}
