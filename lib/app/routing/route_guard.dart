import 'package:asset_tracker/features/auth/application/authentication_cubit.dart';
import 'package:asset_tracker/features/auth/application/authentication_state.dart';
import 'package:auto_route/auto_route.dart';
import 'package:asset_tracker/app/routing/app_router.gr.dart'; // Your router file
import 'package:asset_tracker/core/utils/setup_locator.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthenticationCubit _authenticationCubit = getIt<AuthenticationCubit>();

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final bool isSignedIn =
        _authenticationCubit.state is AuthenticationStateAuthenticated;

    print('AuthGuard: User is signed in: $isSignedIn');

    // Check if the user is authenticated
    if (isSignedIn) {
      // If the user is authenticated, continue with navigation
      resolver.next(true);
    } else {
      // If the user is not authenticated, redirect to the login page
      // The redirection to the login screen is handled here
      router.push(const RegistrationRoute());
    }
  }
}
