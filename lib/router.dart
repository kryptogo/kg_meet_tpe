import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kg_meet_tpe/presentation/generate_result_screen.dart';
import 'package:kg_meet_tpe/presentation/generate_wallet_screen.dart';

part 'router.g.dart';

@TypedGoRoute<GenerateWalletRoute>(
  path: '/generate',
  routes: [TypedGoRoute<GenerateResultRoute>(path: 'result')],
)
class GenerateWalletRoute extends GoRouteData {
  @override
  Widget build(context, state) {
    return const GenerateWalletScreen();
  }
}

class GenerateResultRoute extends GoRouteData {
  @override
  Page<void> buildPage(context, state) {
    return const NoTransitionPage(
      child: GenerateResultScreen(),
    );
  }
}
