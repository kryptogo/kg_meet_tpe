// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $generateWalletRoute,
    ];

RouteBase get $generateWalletRoute => GoRouteData.$route(
      path: '/generate',
      factory: $GenerateWalletRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'result',
          factory: $GenerateResultRouteExtension._fromState,
        ),
      ],
    );

extension $GenerateWalletRouteExtension on GenerateWalletRoute {
  static GenerateWalletRoute _fromState(GoRouterState state) =>
      GenerateWalletRoute();

  String get location => GoRouteData.$location(
        '/generate',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $GenerateResultRouteExtension on GenerateResultRoute {
  static GenerateResultRoute _fromState(GoRouterState state) =>
      GenerateResultRoute();

  String get location => GoRouteData.$location(
        '/generate/result',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
