// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:asset_tracker/core/shell/presentation/shell_screen.dart' as _i4;
import 'package:asset_tracker/features/auth/presentation/registration_screen.dart'
    as _i3;
import 'package:asset_tracker/features/home/presentation/home_screen.dart'
    as _i1;
import 'package:asset_tracker/features/profile/profile_screen.dart' as _i2;
import 'package:asset_tracker/features/splash/splash_screen.dart' as _i5;
import 'package:asset_tracker/features/user_asset/presentation/user_assets_screen.dart'
    as _i6;
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeScreen();
    },
  );
}

/// generated route for
/// [_i2.ProfileScreen]
class ProfileRoute extends _i7.PageRouteInfo<void> {
  const ProfileRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i3.RegistrationScreen]
class RegistrationRoute extends _i7.PageRouteInfo<void> {
  const RegistrationRoute({List<_i7.PageRouteInfo>? children})
      : super(
          RegistrationRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.RegistrationScreen();
    },
  );
}

/// generated route for
/// [_i4.ShellScreen]
class ShellRoute extends _i7.PageRouteInfo<ShellRouteArgs> {
  ShellRoute({
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          ShellRoute.name,
          args: ShellRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ShellRoute';

  static _i7.PageInfo page = _i7.PageInfo(
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

  final _i8.Key? key;

  @override
  String toString() {
    return 'ShellRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.SplashScreen]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.SplashScreen();
    },
  );
}

/// generated route for
/// [_i6.UserAssetsScreen]
class UserAssetsRoute extends _i7.PageRouteInfo<void> {
  const UserAssetsRoute({List<_i7.PageRouteInfo>? children})
      : super(
          UserAssetsRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserAssetsRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.UserAssetsScreen();
    },
  );
}
