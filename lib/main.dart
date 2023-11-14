import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kg_kit/kg_kit.dart';
import 'package:kg_meet_tpe/router.dart' as router;

void main() {
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
    return ScreenUtilInit(
        designSize: const Size(1440, 760),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return KgMaterialApp.router(
            title: 'KryptoGO Meet Taipei',
            routerConfig: _router,
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('zh', 'TW'),
            ],
          );
        });
  }
}
