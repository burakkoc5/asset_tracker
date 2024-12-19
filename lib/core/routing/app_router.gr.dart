// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:asset_tracker/features/auth/infrastructure/abstract/authentication_service.dart'
    as _i6;
import 'package:asset_tracker/features/auth/presentation/registration_screen.dart'
    as _i2;
import 'package:asset_tracker/features/profile/home.dart' as _i1;
import 'package:asset_tracker/features/splash/splash_screen.dart' as _i3;
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

/// generated route for
/// [_i1.ProfileScreen]
class ProfileRoute extends _i4.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i5.Key? key,
    required _i6.AuthenticationService authenticationService,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(
            key: key,
            authenticationService: authenticationService,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileRouteArgs>();
      return _i1.ProfileScreen(
        key: args.key,
        authenticationService: args.authenticationService,
      );
    },
  );
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    required this.authenticationService,
  });

  final _i5.Key? key;

  final _i6.AuthenticationService authenticationService;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, authenticationService: $authenticationService}';
  }
}

/// generated route for
/// [_i2.RegistrationScreen]
class RegistrationRoute extends _i4.PageRouteInfo<void> {
  const RegistrationRoute({List<_i4.PageRouteInfo>? children})
      : super(
          RegistrationRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.RegistrationScreen();
    },
  );
}

/// generated route for
/// [_i3.SplashScreen]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute({List<_i4.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.SplashScreen();
    },
  );
}
