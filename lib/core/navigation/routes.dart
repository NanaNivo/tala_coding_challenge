import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_coding_challenge/presentation/flows/auth_flow/login_page.dart';
import 'package:tala_coding_challenge/presentation/flows/auth_flow/register_page.dart';

import 'package:tala_coding_challenge/presentation/flows/root_flow/screens/root_page.dart';
import 'package:tala_coding_challenge/presentation/flows/startup_flow/screens/splash_screen.dart';

import '../../app+injection/app.dart';

import '../../app+injection/di.dart';

import '../blocs/application_bloc/app_bloc.dart';
import '../mediators/communication_types/AppStatus.dart';
import '../resources/colors.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final sectionNavigatorKey = GlobalKey<NavigatorState>();

class RoutesPath {
  static String get splashScreen => '/';

  static String get welcomePage => '/welcome';

  static String get loginPage => '/auth';
  static String get RegisterPage => '$loginPage/register';

  static String get rootPage => '/root';
  static String get cartPage => '/cart';

  static String get userPage => '/user';

}

final router = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: rootNavigatorKey,
  routes: routes,
  initialLocation: RoutesPath.splashScreen,
  refreshListenable: GoRouterRefreshStream(locator<AppBloc>().stream),
);

final List<RouteBase> routes = [
  GoRoute(
    parentNavigatorKey: rootNavigatorKey,
    name: "splash",
    path: "/",
    builder: (context, state) {

      return  SplashScreen();
    },
    redirect: (context, goState) {
      print(
          'splash splash splash splash ${locator<AppBloc>().state.isFirstTime} ${goState.location == RoutesPath.splashScreen} ${locator<AppBloc>().state.appStatus} ${goState.matchedLocation}');
      if (locator<AppBloc>().state.appStatus == Status.unauthorized &&
          goState.location == RoutesPath.splashScreen) {


        return RoutesPath.loginPage;
      }
      return null;
    },
  ),
  GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      name: 'loginScreen',
      path: '/auth',
      builder: (context, state) => LogInPage(),
      routes: [
        GoRoute(
            parentNavigatorKey: rootNavigatorKey,
            name: 'RegisterScreen',
            path: 'register',
            builder: (context, state) => RegisterPage(),
            routes: [

            ]),
      ]),
  ShellRoute(
    builder: (context, state, child) {
      Map<String, dynamic>? extra = state.extra as Map<String, dynamic>?;
      return RootPageWidget(
        navigationShell: child,
        index: extra == null ? 0 : extra['index'] ?? 0,
      );
    },
    routes: [
      GoRoute(
          path: '/root',
          builder: (context, state) {
            return Container();
          },
          routes: [

          ],
          redirect: (context, goRouterState) {
            print('dddddddddddHome${goRouterState}');
            if (locator<AppBloc>().state.appStatus == Status.unauthorized) {
              //  return RoutesPath.loginPage;
            }
            return null;
          }),
      GoRoute(
          path: '/category',
          builder: (context, state) {
            return Container();
          },
          routes: [


          ],
         ),
      GoRoute(
          path: '/cart',
          builder: (context, state) {
            return Container();
          },
          routes: [],
         ),
      GoRoute(
          path: '/user',
          builder: (context, state) {
            return Container();
          },
          routes: [],

         ),
    ],
  ),
];

class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription<Status> _subscription;

  GoRouterRefreshStream(Stream<AppState> stream) {
    notifyListeners();
    _subscription = stream
        .asBroadcastStream()
        .map((AppState event) => event.appStatus)
        .listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
