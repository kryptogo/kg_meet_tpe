
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kg_meet_tpe/router.dart' as router;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

final _router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: router.GenerateWalletRoute().location,
  onException: (context, state, router) {
    debugPrint('GoRoute onException ${state.error}');
  },
  routes: [
    ...router.$appRoutes,
  ],
);


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'KryptoGO Meet Taipei',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }
}

