import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:kg_kit/kg_kit.dart';
import 'package:kg_meet_tpe/router.dart' as router;

void main() {
  // setUrlStrategy(PathUrlStrategy());
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const KgKit(child: MyApp()));
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
    return KgMaterialApp.router(
      title: 'KryptoGO 靈魂錢包生成器',
      routerConfig: _router,
      supportedLocales: const [
        Locale('en', 'US'),
      ],
    );
  }
}
